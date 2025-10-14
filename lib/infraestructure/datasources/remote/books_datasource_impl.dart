import 'package:book_stack/config/errors/exceptions.dart';
import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/config/services/center_api.dart';
import 'package:book_stack/config/services/server.dart';
import 'package:book_stack/domain/datasource/books_datasource.dart';
import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/infraestructure/helpers/clean_query.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';
import 'package:book_stack/infraestructure/models/server_response.dart';

class BooksDataSourceImpl implements BooksDataSource {
  
  @override
  Future <List<Book>> getNewBooks() async {
    try {
      final ServerResponse response = await CenterApi.get( urlSpecific: Server.getNewBooksEndpoint(),);
      if (!response.isSuccess || response.result == '') {
        throw BooksNewException(message: 'Error');
      }
      final Map<String, dynamic> result = response.result as Map<String, dynamic>;
      final List<dynamic> books = result['books'] as List<dynamic>;
  return Book.listFromMaps(books);
    } catch (e) {
      throw BooksNewFailure(message: e.toString());
    }
  }

  @override
  Future <BookDetails> getBookDetails(String bookId) async {
    try {
      final ServerResponse response = await CenterApi.get( urlSpecific: Server.getBookByIdEndpoint(bookId),);
      if (!response.isSuccess || response.result == '') {
        throw BookDetailsException(message: 'Error');
      }
      return BookDetails.fromJson(response.result as Map<String, dynamic>);
    } catch (e) {
      throw BookDetailsFailure(message: e.toString());
    }
  }
  @override
  Future<SearchBooksResponse> getSearchBooks(GetSearchBooksRequest params) async {
    try {
      final ServerResponse response = await CenterApi.get(
        urlSpecific: Server.getSearchBooksEndpoint(page: params.page, query: cleanQuery(params.query)),
      );
      if (!response.isSuccess || response.result == '') {
        throw BookSearchException(message: 'Error');
      }
      final Map<String, dynamic> result = response.result as Map<String, dynamic>;
      return SearchBooksResponse.fromJson(result);
    } catch (e) {
      throw BookSearchFailure(message: e.toString());
    }
  }
}
