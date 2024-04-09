
import 'package:antio_books/config/errors/failures.dart';
import 'package:antio_books/domain/entities/book_details.dart';
import 'package:antio_books/domain/repositories/book_repository.dart';
import 'package:antio_books/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetBookDetailsUseCase extends UseCase< BookDetails , String> {
  BooksRepository booksRepository;

  GetBookDetailsUseCase({required this.booksRepository});

  @override
  Future<Either<Failure, BookDetails>> call(params) async => await booksRepository.getBookDetails(params);
}