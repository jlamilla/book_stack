
import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book.dart';
import '../../domain/use_cases/get_books_new_use_case.dart';
import '../../domain/use_cases/use_case.dart';
import '../errors/failures.dart';
import '../injection_dependencies/injection_container.dart';

class BooksNewProvider extends ChangeNotifier {

  BooksNewProvider({required this.getBooksNewUseCase}) {
    getbooksNews();
    getHistoryBooks();
  }

  List<Book> booksNews = <Book>[];
  List<Book> historyBooks   = <Book>[];

  final GetBooksNewUseCase getBooksNewUseCase;

  Future<void> getbooksNews() async {
    final Either<Failure, List<Book>> result = await getBooksNewUseCase.call(NoParams());
    result.fold(
      (Failure l) {
        log(l.toString());
      },
      (List<Book> r) {
        booksNews = r;
        notifyListeners();
      },
    );
  }

  void getHistoryBooks(){ 
    historyBooks = sl<Box<Book>>().values.toList();
    notifyListeners();
  }
}
