
import 'package:antio_books/config/injection_dependencies/injection_container.dart';
import 'package:antio_books/domain/repositories/book_repository.dart';
import 'package:antio_books/infraestructure/repositories/books_repository_impl.dart';

void registerRepositories() {
  sl.registerLazySingleton<BooksRepository>(
    () => BooksRepositoryImpl(booksDatasource: sl(),),
  );
}
