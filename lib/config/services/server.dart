abstract class Server {
  static const String _dbServerUrl = 'https://api.itbook.store/1.0/';

  static const String _getSearchBooks = '${_dbServerUrl}search';
  static const String _getNewBooks = '${_dbServerUrl}new';
  static const String _getBookDetails = '${_dbServerUrl}books';

  
  static String getSearchBooksEndpoint({int page = 1, required String query}) => '$_getSearchBooks/$query/$page';
  static String getNewBooksEndpoint() => _getNewBooks;
  static String getBookByIdEndpoint(String bookId) => '$_getBookDetails/$bookId';
}
