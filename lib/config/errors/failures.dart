abstract class Failure {}

class BookSearchFailure extends Failure {
  final String message;
  BookSearchFailure({required this.message});
}
class BooksNewFailure extends Failure {
  final String message;
  BooksNewFailure({required this.message});
}
class BookDetailsFailure extends Failure {
  final String message;
  BookDetailsFailure({required this.message});
}