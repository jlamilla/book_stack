
import '../../domain/datasource/books_datasource.dart';
import '../../infraestructure/datasources/books_datasource_impl.dart';
import 'injection_container.dart';

void registerDataSources() {
  sl.registerLazySingleton<BooksDataSource>(
    () => BooksDataSourceImpl(),
  );
}
