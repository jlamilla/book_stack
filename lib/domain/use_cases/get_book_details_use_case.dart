
import 'package:dartz/dartz.dart';

import '../../config/errors/failures.dart';
import '../entities/book_details.dart';
import '../repositories/book_repository.dart';
import 'use_case.dart';

class GetBookDetailsUseCase extends UseCase< BookDetails , String> {

  GetBookDetailsUseCase({required this.booksRepository});

  final BooksRepository booksRepository;

  @override
  Future<Either<Failure, BookDetails>> call(String params) => booksRepository.getBookDetails(params);
}
