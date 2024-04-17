
import 'package:dartz/dartz.dart';

import '../../config/errors/failures.dart';
import '../../infraestructure/models/get_search_books_body.dart';
import '../entities/book.dart';
import '../repositories/book_repository.dart';
import 'use_case.dart';

class GetSearchBooksUseCase extends UseCase<List<Book>, GetSearchBooksBody> {

  GetSearchBooksUseCase({required this.booksRepository});

  BooksRepository booksRepository;

  @override
  Future<Either<Failure, List<Book>>> call(GetSearchBooksBody params) => booksRepository.getSearchBooks(params);
}
