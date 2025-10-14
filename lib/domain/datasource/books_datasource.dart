import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';

abstract class BooksDataSource {
  Future <List<Book>> getNewBooks();
  Future <BookDetails> getBookDetails(String params);
  Future <SearchBooksResponse> getSearchBooks(GetSearchBooksRequest params);
}
