import 'package:antio_books/config/errors/exceptions.dart';
import 'package:antio_books/config/errors/failures.dart';
import 'package:antio_books/config/services/center_api.dart';
import 'package:antio_books/config/services/server.dart';
import 'package:antio_books/domain/datasource/books_datasource.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/entities/book_details.dart';
import 'package:antio_books/infraestructure/models/get_search_books_body.dart';
import 'package:antio_books/infraestructure/models/server_response.dart';

class BooksDataSourceImpl implements BooksDataSource {
  
  @override
  Future <List<Book>> getNewBooks() async {
    try {
      ServerResponse response = await CenterApi.get( urlSpecific: Server.getNewBooksEndpoint(),);
      if (!response.isSuccess || response.result["books"] == "") {
        throw BooksNewException(message: "Error");
      }
      return Book.listFromMaps(response.result["books"]);
    } catch (e) {
      throw BooksNewFailure(message: e.toString());
    }
  }
  @override
  Future <BookDetails> getBookDetails(String bookId) async {
    try {
      ServerResponse response = await CenterApi.get( urlSpecific: Server.getBookByIdEndpoint(bookId),);
      if (!response.isSuccess || response.result == "") {
        throw BookDetailsException(message: "Error");
      }
      return BookDetails.fromMap(response.result);
    } catch (e) {
      throw BookDetailsFailure(message: e.toString());
    }
  }
  @override
  Future <List<Book>> getSearchBooks(GetSearchBooksBody params) async {
    try {
      ServerResponse response = await CenterApi.get( urlSpecific: Server.getSearchBooksEndpoint(page: params.page, query: params.query),);
      if (!response.isSuccess || response.result["books"] == "") {
        throw BooksNewException(message: "Error");
      }
      return Book.listFromMaps(response.result["books"]);
    } catch (e) {
      throw BooksNewFailure(message: e.toString());
    }
  }
}