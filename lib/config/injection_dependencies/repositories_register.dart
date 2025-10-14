
import 'package:book_stack/config/injection_dependencies/data_sources_register.dart';
import 'package:book_stack/domain/datasource/books_datasource.dart';
import 'package:book_stack/domain/repositories/book_repository.dart';
import 'package:book_stack/infraestructure/repositories/books_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<BooksRepository> booksRepositoryProvider = Provider<BooksRepository>((Ref ref) {
  final BooksDataSource dataSource = ref.read(booksDataSourceProvider);
  return BooksRepositoryImpl(booksDatasource: dataSource);
});
