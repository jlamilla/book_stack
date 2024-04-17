import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book.dart';
import '../../domain/use_cases/get_search_books_use_case.dart';
import '../../infraestructure/models/get_search_books_body.dart';
import '../errors/failures.dart';
import '../injection_dependencies/injection_container.dart';

class SearchBooksProvider extends ChangeNotifier {

  SearchBooksProvider({required this.getSearchBooksUseCase});

  final GetSearchBooksUseCase getSearchBooksUseCase;
  int _page = 1;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  List<Book> booksTemp = <Book>[];

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Future<List<Book>> searchBooks(String query) async {
    final GetSearchBooksBody params = GetSearchBooksBody(query: query, page: _page);
    final Either<Failure, List<Book>> result = await getSearchBooksUseCase.call(params);
    result.fold(
      (Failure l) {
        log(l.toString());
      },
      (List<Book> r) {
        _page++;
        booksTemp = <Book>[...booksTemp, ...r];
      },
    );
    return booksTemp;
  }

  Future<void> createBookHistory(Book book) async {
    if (sl<Box<Book>>().length == 5) {
      for (int i = sl<Box<Book>>().length - 1; i > 0; i--) {
        final Book booksTemp = sl<Box<Book>>().getAt(i - 1)!;
        sl<Box<Book>>().putAt( i,
            Book(
              title: booksTemp.title,
              subtitle: booksTemp.subtitle,
              isbn13: booksTemp.isbn13,
              price: booksTemp.price,
              image: booksTemp.image,
              url: booksTemp.url,
            ));
      }
      sl<Box<Book>>().putAt(0, book);
    } else {
      sl<Box<Book>>().add(book);
    }
  }
}
