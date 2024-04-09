class BookSearchException implements Exception {
  final String message;
  BookSearchException({required this.message});
}

class BooksNewException implements Exception {
  final String message;
  BooksNewException({required this.message});
}

class BookDetailsException implements Exception {
  final String message;
  BookDetailsException({required this.message});
}