import 'package:book_stack/domain/datasource/books_datasource.dart';
import 'package:book_stack/infraestructure/datasources/remote/books_datasource_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<BooksDataSource> booksDataSourceProvider = Provider<BooksDataSource>((Ref ref) {
  return BooksDataSourceImpl();
});
