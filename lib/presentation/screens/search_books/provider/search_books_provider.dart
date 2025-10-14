import 'dart:async';
import 'dart:developer';

import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/config/injection_dependencies/use_cases_register.dart';
import 'package:book_stack/config/router/routers.dart';
import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/domain/entities/book/book.dart' as bk;
import 'package:book_stack/domain/use_cases/get_search_books_use_case.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';
import 'package:book_stack/presentation/screens/search_books/provider/search_books_state.dart';
import 'package:book_stack_design_system/designs/utils/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final NotifierProvider<SearchBooksNotifier, SearchBooksState> searchBooksProvider = NotifierProvider<SearchBooksNotifier, SearchBooksState>(SearchBooksNotifier.new);

class SearchBooksNotifier extends Notifier<SearchBooksState> {
  late final GetSearchBooksUseCase getSearchBooksUseCase;
  Timer? _debounce;

  @override
  SearchBooksState build() {
    getSearchBooksUseCase = ref.read(getSearchBooksUseCaseProvider);
    return const SearchBooksState();
  }

  void setSearchQuery(String value) {
    if (value == state.searchQuery) {
      return;
    }

    if (value.length < 2) {
      state = state.copyWith(
        searchQuery: '',
        books: <Book>[],
        page: 1,
        isLoading: false,
        noResults: false,
        hasMore: true,
      );
      return;
    }

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () async {
      state = state.copyWith(
        searchQuery: value, 
        books: <Book>[], 
        page: 1, 
        isLoading: true, 
        noResults: false, 
        hasMore: true,
        error: false,
      );
      await searchBooks(value, reset: true);
    });
  }

  Future<void> searchBooks(String query, {bool reset = false}) async {
    final int page = reset ? 1 : state.page;
    final GetSearchBooksRequest params = GetSearchBooksRequest(
      query: query,
      page: page,
    );
    final Either<Failure, SearchBooksResponse> result = await getSearchBooksUseCase.call(params);
    result.fold(
      (Failure l) {
        log(l.toString());
        state = state.copyWith(
          isLoading: false,
          error: true,
        );
      },
      (SearchBooksResponse r) {
        final List<Book> updatedBooks = reset ? r.books : <Book>[...state.books, ...r.books];
        final bool noResults = updatedBooks.isEmpty;
        final bool hasMore = updatedBooks.length < int.parse(r.total);
        state = state.copyWith(
          books: updatedBooks,
          page: page + 1,
          isLoading: false,
          noResults: noResults,
          hasMore: hasMore,
          error: false,
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) {
      return;
    }
    await searchBooks(state.searchQuery);
  }

  void goToDetails(BuildContext context, bk.Book book) {
    BookStackLogger.debug('Navigating to details of book: ${book.isbn13}');
    context.push('${RoutesBookStack.bookDetails}?id=${book.isbn13}');
  }

  void clear() {
    state = const SearchBooksState();
  }

  void clearAndGoHome(BuildContext context) {
    clear();
    GoRouter.of(context).go(RoutesBookStack.home);
  }
}
