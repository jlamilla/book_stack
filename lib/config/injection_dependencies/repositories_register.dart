
import '../../domain/repositories/book_repository.dart';
import '../../infraestructure/repositories/books_repository_impl.dart';
import 'injection_container.dart';

void registerRepositories() {
  sl.registerLazySingleton<BooksRepository>(
    () => BooksRepositoryImpl(booksDatasource: sl(),),
  );
}
