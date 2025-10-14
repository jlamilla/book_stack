
import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';
import 'package:dartz/dartz.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<Book>>> getBooks();
  Future<Either<Failure, BookDetails>> getBookDetails(String params);
  Future<Either<Failure, SearchBooksResponse>> getSearchBooks(GetSearchBooksRequest params);
}
