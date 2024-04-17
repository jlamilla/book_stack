
import '../../domain/use_cases/get_book_details_use_case.dart';
import '../../domain/use_cases/get_books_new_use_case.dart';
import '../../domain/use_cases/get_search_books_use_case.dart';
import 'injection_container.dart';

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
