import '../../infraestructure/models/get_search_books_body.dart';
import '../entities/book.dart';
import '../entities/book_details.dart';

abstract class BooksDataSource {
  Future <List<Book>> getNewBooks();
  Future <BookDetails> getBookDetails(String params);
  Future <List<Book>> getSearchBooks(GetSearchBooksBody params);
}
