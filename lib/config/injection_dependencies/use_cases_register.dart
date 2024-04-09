
import 'package:antio_books/config/injection_dependencies/injection_container.dart';
import 'package:antio_books/domain/use_cases/get_book_details_use_case.dart';
import 'package:antio_books/domain/use_cases/get_books_new_use_case.dart';
import 'package:antio_books/domain/use_cases/get_search_books_use_case.dart';

void registerUseCases() {
  sl.registerLazySingleton(
    () => GetBooksNewUseCase(
      booksRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetSearchBooksUseCase(
      booksRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetBookDetailsUseCase(
      booksRepository: sl(),
    ),
  );
}
