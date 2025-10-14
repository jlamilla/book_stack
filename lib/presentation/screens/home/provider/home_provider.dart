import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/config/injection_dependencies/use_cases_register.dart';
import 'package:book_stack/config/router/routers.dart';
import 'package:book_stack/domain/entities/book/book.dart' as bk;
import 'package:book_stack/domain/use_cases/get_search_books_use_case.dart';
import 'package:book_stack/infraestructure/datasources/local/book_stack_database.dart';
import 'package:book_stack/infraestructure/datasources/local/book_stack_database_provider.dart';
import 'package:book_stack/infraestructure/models/books/request/get_search_books_request.dart';
import 'package:book_stack/infraestructure/models/books/response/search_books_response.dart';
import 'package:book_stack/presentation/screens/home/provider/home_state.dart';
import 'package:book_stack_design_system/designs/utils/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final NotifierProvider<HomeNotifier, HomeState> homeProvider = NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends Notifier<HomeState> {
  late final GetSearchBooksUseCase _getSearchBooksUseCase;

  @override
  HomeState build() {
    _getSearchBooksUseCase = ref.read(getSearchBooksUseCaseProvider);
    return const HomeState();
  }

  Future<void> toggleFavorites() async {
    try {
      if (state.isFavorite) {
        state = state.copyWith(isFavorite: false, isLoading: true);
        await loadInitial();
      } else {
        state = state.copyWith(isFavorite: true, isLoading: true);
        await Future<void>.delayed(const Duration(milliseconds: 200));
        final BookStackDatabase db = ref.read(driftDatabaseProvider);
        final List<BookFavorite> favorites = await db.getAllFavorites(orderByPriceAsc: state.orderByPriceAsc);
        state = state.copyWith(
          isLoading: false,
          hasMore: false,
          books: favorites.map((BookFavorite e) => bk.Book(
            title: e.title,
            subtitle: e.subtitle ?? '',
            isbn13: e.isbn13,
            price: e.price ?? '',
            image: e.image ?? '',
            url: e.url ?? '',
          )).toList(),
        );
      }
    } catch (e) {
      BookStackLogger.error('Error toggling favorites: $e');
      state = state.copyWith(isLoading: false, error: true, hasMore: false);
    }
  }

  Future<void> loadInitial() async {
    state = state.copyWith(
      isLoading: true,
      books: <bk.Book>[],
      page: 1,
      searchQuery: 'programming',
      hasMore: true,
      isFavorite: false,
    );
    await Future<void>.delayed(const Duration(milliseconds: 200));
    await _fetchBooks();
    state = state.copyWith(isLoading: false);
  }

  Future<void> _fetchBooks() async {
    final GetSearchBooksRequest params = GetSearchBooksRequest(
      query: state.searchQuery,
      page: state.page,
    );
    final Either<Failure, SearchBooksResponse> result = await _getSearchBooksUseCase.call(params);
    result.fold(
      (Failure failure) {
        BookStackLogger.error(failure.toString());
        state = state.copyWith(
          hasMore: false,
          error: true,
        );
      },
      (SearchBooksResponse response) {
        if (response.books.isEmpty) {
          state = state.copyWith(hasMore: false);
        } else {
          final List<bk.Book> newBooks = <bk.Book>[...state.books, ...response.books];
          final bool hasMore = newBooks.length < int.parse(response.total);
          state = state.copyWith(
            books: newBooks,
            page: state.page + 1,
            hasMore: hasMore,
            error: false,
          );
        }
      },
    );
  }

  Future<void> refreshFavorites() async {
    if (state.isFavorite) {
      state = state.copyWith(isLoading: true);
      final BookStackDatabase db = ref.read(driftDatabaseProvider);
      final List<BookFavorite> favorites = await db.getAllFavorites(orderByPriceAsc: state.orderByPriceAsc);
      state = state.copyWith(
        isLoading: false,
        books: favorites.map((BookFavorite e) => bk.Book(
          title: e.title,
          subtitle: e.subtitle ?? '',
          isbn13: e.isbn13,
          price: e.price ?? '',
          image: e.image ?? '',
          url: e.url ?? '',
        )).toList(),
      );
    }
  }

  Future<List<bk.Book>> onLoadMore() async {
    if (state.hasMore && !state.isFavorite) {
      await _fetchBooks();
    }
    return state.books;
  }

  void goToDetails(BuildContext context, bk.Book book) {
    BookStackLogger.debug('Navigating to details of book: ${book.isbn13}');
    context.push('${RoutesBookStack.bookDetails}?id=${book.isbn13}');
  }

  void goToSearchBooks(BuildContext context) {
    BookStackLogger.debug('Navigating to search books');
    context.go(RoutesBookStack.searchBooks);
  }

  Future<void> onSortChanged(String value) async {
    final bool asc = value == 'Price Ascending';
    state = state.copyWith(orderByPriceAsc: asc, isLoading: true);
    await Future<void>.delayed(const Duration(milliseconds: 200));
    await refreshFavorites();
  }
}
