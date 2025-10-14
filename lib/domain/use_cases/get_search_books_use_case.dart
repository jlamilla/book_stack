
import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/domain/repositories/book_repository.dart';
import 'package:book_stack/domain/use_cases/use_case.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';
import 'package:dartz/dartz.dart';

class GetSearchBooksUseCase extends UseCase<SearchBooksResponse, GetSearchBooksRequest> {

  GetSearchBooksUseCase({required this.booksRepository});

  BooksRepository booksRepository;

  @override
  Future<Either<Failure, SearchBooksResponse>> call(GetSearchBooksRequest params) => booksRepository.getSearchBooks(params);
}
