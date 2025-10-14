import 'dart:io';

import 'package:book_stack/infraestructure/datasources/local/tables/all_tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'book_stack_database.g.dart';

@DriftDatabase(tables: <Type>[BookFavorites, BookRatings])
class BookStackDatabase extends _$BookStackDatabase {
  
  BookStackDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final Directory dbFolder = await getApplicationDocumentsDirectory();
      final File file = File(p.join(dbFolder.path, 'app.db'));

      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      sqlite3.tempDirectory = (await getTemporaryDirectory()).path;

      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (Migrator m, int from, int to) async {
      await m.createAll();
    },
    onCreate: (Migrator m) async {
      await m.createAll();
    },
  );

  //*** Methods for managing favorites ***/
  //-------------------------------------------------------------

  Future<int> insertFavorite(BookFavoritesCompanion favorite) => into(bookFavorites).insert(favorite);

  Future<int> deleteFavoriteByIsbn13(String isbn13) => (delete(bookFavorites)..where(($BookFavoritesTable tbl) => tbl.isbn13.equals(isbn13))).go();

  Future<List<BookFavorite>> getAllFavorites({bool orderByPriceAsc = true}) {
    final SimpleSelectStatement<$BookFavoritesTable, BookFavorite> query = select(bookFavorites);

    final OrderingTerm priceOrdering = OrderingTerm(
      expression: const CustomExpression<double>(r"CAST(REPLACE(price, '$', '') AS REAL)"),
      mode: orderByPriceAsc ? OrderingMode.asc : OrderingMode.desc,
    );

    query.orderBy(<OrderClauseGenerator<$BookFavoritesTable>>[(_) => priceOrdering]);

    return query.get();
  }

  Future<bool> isFavorite(String isbn13) async {
    final List<BookFavorite> result = await (select(bookFavorites)..where(($BookFavoritesTable tbl) => tbl.isbn13.equals(isbn13))).get();
    return result.isNotEmpty;
  }

  //*** MMethods for managing ratings ***/
  //-------------------------------------------------------------

  Future<void> setRating(String isbn13, int rating) async {
    final BookRating? existing = await (select(bookRatings)..where(($BookRatingsTable tbl) => tbl.isbn13.equals(isbn13))).getSingleOrNull();
    if (existing != null) {
      await (update(bookRatings)..where(($BookRatingsTable tbl) => tbl.isbn13.equals(isbn13))).write(
        BookRatingsCompanion(rating: Value<double>(rating.toDouble()))
      );
    } else {
      await into(bookRatings).insert(BookRatingsCompanion(
          isbn13: Value<String>(isbn13), 
          rating: Value<double>(rating.toDouble())
        )
      );
    }
  }

  Future<int?> getRating(String isbn13) async {
    final BookRating? result = await (select(bookRatings)..where(($BookRatingsTable tbl) => tbl.isbn13.equals(isbn13))).getSingleOrNull();
    if (result != null) {
      return result.rating.round();
    }
    return null;
  }
}
