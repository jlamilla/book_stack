import 'dart:async';
import 'dart:developer';

import 'package:antio_books/config/constants/boxes.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/domain/use_cases/get_search_books_use_case.dart';
import 'package:antio_books/infraestructure/models/get_search_books_body.dart';
import 'package:flutter/material.dart';

class SearchBooksProvider extends ChangeNotifier {
  final GetSearchBooksUseCase getSearchBooksUseCase;
  int _page = 1;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  List<Book> booksTemp = [];

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  SearchBooksProvider({required this.getSearchBooksUseCase});

  Future<List<Book>> searchBooks(String query) async {
    final params = GetSearchBooksBody(query: query, page: _page);
    final result = await getSearchBooksUseCase.call(params);
    result.fold(
      (l) {
        log(l.toString());
      },
      (r) {
        _page++;
        booksTemp = [...booksTemp, ...r];
      },
    );
    return booksTemp;
  }

  Future<void> createBookHistory(Book book) async {
    if (boxBooks.length == 5) {
      for (int i = boxBooks.length - 1; i > 0; i--) {
        final Book booksTemp = boxBooks.getAt(i - 1)!;
        boxBooks.putAt( i,
            Book(
              title: booksTemp.title,
              subtitle: booksTemp.subtitle,
              isbn13: booksTemp.isbn13,
              price: booksTemp.price,
              image: booksTemp.image,
              url: booksTemp.url,
            ));
      }
      boxBooks.putAt(0, book);
    } else {
      boxBooks.add(book);
    }
  }
}
