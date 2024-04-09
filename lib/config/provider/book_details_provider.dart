import 'dart:developer';

import 'package:antio_books/domain/entities/book_details.dart';
import 'package:antio_books/domain/use_cases/get_book_details_use_case.dart';
import 'package:flutter/material.dart';

class BooksDetailsProvider extends ChangeNotifier {

  final GetBookDetailsUseCase getBookDetailsUseCase;
  late BookDetails? bookDetails;

  BooksDetailsProvider( {required this.getBookDetailsUseCase});
  
  Future<void> getBookDetails(String bookID) async {
    final result = await getBookDetailsUseCase.call(bookID);
    result.fold(
      (l) {
        log(l.toString());
      },
      (r) {
        bookDetails = r;
        notifyListeners();
      },
    );
  }

}