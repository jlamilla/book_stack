
import 'package:antio_books/config/errors/failures.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/entities/book_details.dart';
import 'package:antio_books/infraestructure/models/get_search_books_body.dart';
import 'package:dartz/dartz.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<Book>>> getBooks();
  Future<Either<Failure, BookDetails>> getBookDetails(String params);
  Future<Either<Failure, List<Book>>> getSearchBooks(GetSearchBooksBody params);
}