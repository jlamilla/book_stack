
import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/domain/repositories/book_repository.dart';
import 'package:book_stack/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetBooksNewUseCase extends UseCase<List<Book>, NoParams> {

  GetBooksNewUseCase({required this.booksRepository});
  
  BooksRepository booksRepository;

  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) => booksRepository.getBooks();
}
