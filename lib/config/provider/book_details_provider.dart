import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_details.dart';
import '../../domain/use_cases/get_book_details_use_case.dart';
import '../errors/failures.dart';
import '../injection_dependencies/injection_container.dart';

class BooksDetailsProvider extends ChangeNotifier {
  BooksDetailsProvider({required this.getBookDetailsUseCase});

  final GetBookDetailsUseCase getBookDetailsUseCase;
  String bookID = '';
  BookDetails? bookDetails;

  void clear() {
    bookID = '';
    bookDetails = null;
  }

  Future<void> getBookDetails() async {
    if (bookID != '') {
      final Either<Failure, BookDetails> result =
          await getBookDetailsUseCase.call(bookID);
      result.fold(
        (Failure l) {
          log(l.toString());
        },
        (BookDetails r) {
          bookDetails = r;
          notifyListeners();
        },
      );
    }
  }

  Future<void> createBookDetailsHistory(BookDetails bookDetails) async {
    if (sl<Box<BookDetails>>().length == 5) {
      for (int i = sl<Box<BookDetails>>().length - 1; i > 0; i--) {
        final BookDetails booksTemp = sl<Box<BookDetails>>().getAt(i - 1)!;
        sl<Box<BookDetails>>().putAt(
            i,
            BookDetails(
              title: booksTemp.title,
              subtitle: booksTemp.subtitle,
              isbn13: booksTemp.isbn13,
              price: booksTemp.price,
              image: booksTemp.image,
              url: booksTemp.url,
              authors: booksTemp.authors,
              publisher: booksTemp.publisher,
              pages: booksTemp.pages,
              year: booksTemp.year,
              rating: booksTemp.rating,
              desc: booksTemp.desc,
              pdf: booksTemp.pdf,
            ));
      }
      sl<Box<BookDetails>>().putAt(0, bookDetails);
    } else {
      sl<Box<BookDetails>>().add(bookDetails);
    }
  }
}
