import 'package:book_stack/config/errors/exceptions.dart';
import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/domain/datasource/books_datasource.dart';
import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/domain/repositories/book_repository.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';
import 'package:dartz/dartz.dart';

class BooksRepositoryImpl implements BooksRepository {

  BooksRepositoryImpl({required this.booksDatasource});

  BooksDataSource booksDatasource;

  @override
  Future<Either<Failure, List<Book>>> getBooks() async {
    try {
      return Right<Failure, List<Book>>(await booksDatasource.getNewBooks());
    } on BooksNewException catch (e) {
      return Left<Failure, List<Book>>(BooksNewFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BookDetails>> getBookDetails(String params) async {
    try {
      return Right<Failure, BookDetails>(await booksDatasource.getBookDetails(params));
    } on BookDetailsException catch (e) {
      return Left<Failure, BookDetails>(BookDetailsFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, SearchBooksResponse>> getSearchBooks(GetSearchBooksRequest params) async {
    try {
      final SearchBooksResponse response = await booksDatasource.getSearchBooks(params);
      return Right<Failure, SearchBooksResponse>(response);
    } on BookSearchException catch (e) {
      return Left<Failure, SearchBooksResponse>(BookSearchFailure(message: e.message));
    }
  }

}
