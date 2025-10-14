import 'package:book_stack/domain/entities/book/book.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {

  const HomeState({
    this.books = const <Book>[],
    this.orderByPriceAsc = false,
    this.isLoading = false,
    this.hasMore = true,
    this.isFavorite = false,
    this.searchQuery = 'programming',
    this.page = 1,
    this.error = false,
  });

  final List<Book> books;
  final bool orderByPriceAsc;
  final bool isLoading;
  final bool hasMore;
  final bool isFavorite;
  final String searchQuery;
  final int page;
  final bool error;

  HomeState copyWith({
    List<Book>? books,
    bool? orderByPriceAsc,
    bool? isLoading,
    bool? hasMore,
    bool? isFavorite,
    String? searchQuery,
    int? page,
    bool? error,
  }) {
    return HomeState(
      books: books ?? this.books,
      orderByPriceAsc: orderByPriceAsc ?? this.orderByPriceAsc,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      isFavorite: isFavorite ?? this.isFavorite,
      searchQuery: searchQuery ?? this.searchQuery,
      page: page ?? this.page,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => <Object?>[books, isLoading, hasMore, isFavorite, searchQuery, page, error];
}
