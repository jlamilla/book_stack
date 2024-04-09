import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/entities/book_details.dart';
import 'package:antio_books/infraestructure/models/get_search_books_body.dart';

abstract class BooksDataSource {
  Future <List<Book>> getNewBooks();
  Future <BookDetails> getBookDetails(String params);
  Future <List<Book>> getSearchBooks(GetSearchBooksBody params);
}