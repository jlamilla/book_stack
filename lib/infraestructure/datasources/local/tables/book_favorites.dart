import 'package:drift/drift.dart';

class BookFavorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().nullable()();
  TextColumn get isbn13 => text()();
  TextColumn get price => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get url => text().nullable()();
}
