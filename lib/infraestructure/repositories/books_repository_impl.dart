import 'package:antio_books/config/errors/exceptions.dart';
import 'package:antio_books/config/errors/failures.dart';
import 'package:antio_books/domain/datasource/books_datasource.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/entities/book_details.dart';
import 'package:antio_books/domain/repositories/book_repository.dart';
import 'package:antio_books/infraestructure/models/get_search_books_body.dart';
import 'package:dartz/dartz.dart';

class BooksRepositoryImpl implements BooksRepository {
  BooksDataSource booksDatasource;

  BooksRepositoryImpl({required this.booksDatasource});

  @override
  Future<Either<Failure, List<Book>>> getBooks() async {
    try {
      return Right(await booksDatasource.getNewBooks());
    } on BooksNewException catch (e) {
      return Left(BooksNewFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BookDetails>> getBookDetails(String params) async {
    try {
      return Right(await booksDatasource.getBookDetails(params));
    } on BookDetailsException catch (e) {
      return Left(BookDetailsFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getSearchBooks(GetSearchBooksBody params) async {
    try {
      return Right(await booksDatasource.getSearchBooks(params));
    } on BookSearchException catch (e) {
      return Left(BookSearchFailure(message: e.message));
    }
  }

}
