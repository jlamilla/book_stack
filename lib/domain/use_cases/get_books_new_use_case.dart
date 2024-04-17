
import 'package:dartz/dartz.dart';

import '../../config/errors/failures.dart';
import '../entities/book.dart';
import '../repositories/book_repository.dart';
import 'use_case.dart';

class GetBooksNewUseCase extends UseCase<List<Book>, NoParams> {

  GetBooksNewUseCase({required this.booksRepository});
  
  BooksRepository booksRepository;

  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) => booksRepository.getBooks();
}
