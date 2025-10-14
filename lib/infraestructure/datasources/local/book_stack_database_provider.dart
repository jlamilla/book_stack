import 'package:book_stack/infraestructure/datasources/local/book_stack_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<BookStackDatabase> driftDatabaseProvider = Provider<BookStackDatabase>((Ref ref) {
  return BookStackDatabase();
});
