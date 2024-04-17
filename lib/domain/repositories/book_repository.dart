
import 'package:dartz/dartz.dart';

import '../../config/errors/failures.dart';
import '../../infraestructure/models/get_search_books_body.dart';
import '../entities/book.dart';
import '../entities/book_details.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<Book>>> getBooks();
  Future<Either<Failure, BookDetails>> getBookDetails(String params);
  Future<Either<Failure, List<Book>>> getSearchBooks(GetSearchBooksBody params);
}
