
import 'package:antio_books/config/errors/failures.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/repositories/book_repository.dart';
import 'package:antio_books/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetBooksNewUseCase extends UseCase<List<Book>, NoParams> {
  BooksRepository booksRepository;

  GetBooksNewUseCase({required this.booksRepository});

  @override
  Future<Either<Failure, List<Book>>> call(params) async => await booksRepository.getBooks();
}