import 'package:dartz/dartz.dart';

import '../../config/errors/exceptions.dart';
import '../../config/errors/failures.dart';
import '../../domain/datasource/books_datasource.dart';
import '../../domain/entities/book.dart';
import '../../domain/entities/book_details.dart';
import '../../domain/repositories/book_repository.dart';
import '../models/get_search_books_body.dart';

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
  Future<Either<Failure, List<Book>>> getSearchBooks(GetSearchBooksBody params) async {
    try {
      return Right<Failure, List<Book>>(await booksDatasource.getSearchBooks(params));
    } on BookSearchException catch (e) {
      return Left<Failure, List<Book>>(BookSearchFailure(message: e.message));
    }
  }

}
