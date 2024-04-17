abstract class Failure {}

class BookSearchFailure extends Failure {
  BookSearchFailure({required this.message});
  final String message;
}
class BooksNewFailure extends Failure {
  BooksNewFailure({required this.message});
  final String message;
}
class BookDetailsFailure extends Failure {
  BookDetailsFailure({required this.message});
  final String message;
}
