import '../../config/errors/exceptions.dart';
import '../../config/errors/failures.dart';
import '../../config/services/center_api.dart';
import '../../config/services/server.dart';
import '../../domain/datasource/books_datasource.dart';
import '../../domain/entities/book.dart';
import '../../domain/entities/book_details.dart';
import '../models/get_search_books_body.dart';
import '../models/server_response.dart';

class BooksDataSourceImpl implements BooksDataSource {
  
  @override
  Future <List<Book>> getNewBooks() async {
    try {
      final ServerResponse response = await CenterApi.get( urlSpecific: Server.getNewBooksEndpoint(),);
      if (!response.isSuccess || response.result == '') {
        throw BooksNewException(message: 'Error');
      }
      return Book.listFromMaps(response.result['books']);
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
      return BookDetails.fromMap(response.result);
    } catch (e) {
      throw BookDetailsFailure(message: e.toString());
    }
  }
  @override
  Future <List<Book>> getSearchBooks(GetSearchBooksBody params) async {
    try {
      final ServerResponse response = await CenterApi.get( urlSpecific: Server.getSearchBooksEndpoint(page: params.page, query: params.query),);
      if (!response.isSuccess || response.result == '') {
        throw BooksNewException(message: 'Error');
      }
      return Book.listFromMaps(response.result['books']);
    } catch (e) {
      throw BooksNewFailure(message: e.toString());
    }
  }
}
