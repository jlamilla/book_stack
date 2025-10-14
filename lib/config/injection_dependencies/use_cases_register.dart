
import 'package:book_stack/config/injection_dependencies/repositories_register.dart';
import 'package:book_stack/domain/repositories/book_repository.dart';
import 'package:book_stack/domain/use_cases/get_book_details_use_case.dart';
import 'package:book_stack/domain/use_cases/get_books_new_use_case.dart';
import 'package:book_stack/domain/use_cases/get_search_books_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<GetBooksNewUseCase> getBooksNewUseCaseProvider = Provider<GetBooksNewUseCase>((Ref ref) {
  final BooksRepository repository = ref.read(booksRepositoryProvider);
  return GetBooksNewUseCase(booksRepository: repository);
});

final Provider<GetSearchBooksUseCase> getSearchBooksUseCaseProvider = Provider<GetSearchBooksUseCase>((Ref ref) {
  final BooksRepository repository = ref.read(booksRepositoryProvider);
  return GetSearchBooksUseCase(booksRepository: repository);
});

final Provider<GetBookDetailsUseCase> getBookDetailsUseCaseProvider = Provider<GetBookDetailsUseCase>((Ref ref) {
  final BooksRepository repository = ref.read(booksRepositoryProvider);
  return GetBookDetailsUseCase(booksRepository: repository);
});
