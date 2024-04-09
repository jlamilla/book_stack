
import 'dart:async';
import 'dart:developer';
import 'package:antio_books/config/constants/boxes.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/use_cases/get_books_new_use_case.dart';
import 'package:antio_books/domain/use_cases/use_case.dart';
import 'package:flutter/material.dart';

class BooksNewProvider extends ChangeNotifier {

  List<Book> booksNews = [];
  List<Book> historyBooks   = [];

  final GetBooksNewUseCase getBooksNewUseCase;

  BooksNewProvider({required this.getBooksNewUseCase}) {
    getbooksNews();
    getHistoryBooks();
  }

  Future<void> getbooksNews() async {
    final result = await getBooksNewUseCase.call(NoParams());
    result.fold(
      (l) {
        log(l.toString());
      },
      (r) {
        booksNews = r;
        notifyListeners();
      },
    );
  }

  void getHistoryBooks(){ 
    historyBooks = boxBooks.values.toList();
    notifyListeners();
  }
}