
import 'package:antio_books/config/errors/failures.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/repositories/book_repository.dart';
import 'package:antio_books/domain/use_cases/use_case.dart';
import 'package:antio_books/infraestructure/models/get_search_books_body.dart';
import 'package:dartz/dartz.dart';

class GetSearchBooksUseCase extends UseCase<List<Book>, GetSearchBooksBody> {
  BooksRepository booksRepository;

  GetSearchBooksUseCase({required this.booksRepository});

  @override
  Future<Either<Failure, List<Book>>> call(params) async => await booksRepository.getSearchBooks(params);
}