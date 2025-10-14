
import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/domain/repositories/book_repository.dart';
import 'package:book_stack/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetBookDetailsUseCase extends UseCase< BookDetails , String> {

  GetBookDetailsUseCase({required this.booksRepository});

  final BooksRepository booksRepository;

  @override
  Future<Either<Failure, BookDetails>> call(String params) => booksRepository.getBookDetails(params);
}
