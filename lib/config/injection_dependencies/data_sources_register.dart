
import 'package:antio_books/config/injection_dependencies/injection_container.dart';
import 'package:antio_books/domain/datasource/books_datasource.dart';
import 'package:antio_books/infraestructure/datasources/books_datasource_impl.dart';

void registerDataSources() {
  sl.registerLazySingleton<BooksDataSource>(
    () => BooksDataSourceImpl(),
  );
}
