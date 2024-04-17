class BookSearchException implements Exception {
  BookSearchException({required this.message});
  final String message;
}

class BooksNewException implements Exception {
  BooksNewException({required this.message});
  final String message;
}

class BookDetailsException implements Exception {
  BookDetailsException({required this.message});
  final String message;
}
