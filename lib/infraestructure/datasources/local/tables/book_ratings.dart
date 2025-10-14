import 'package:drift/drift.dart';

class BookRatings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get isbn13 => text()();
  RealColumn get rating => real()();
}
