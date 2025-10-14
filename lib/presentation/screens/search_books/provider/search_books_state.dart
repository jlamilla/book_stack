import 'package:book_stack/domain/entities/book/book.dart';
import 'package:equatable/equatable.dart';

class SearchBooksState extends Equatable {
  const SearchBooksState({
    this.searchQuery = '',
    this.books = const <Book>[],
    this.page = 1,
    this.isLoading = false,
    this.hasMore = true,
    this.noResults = false,
    this.error = false,
  });

  final String searchQuery;
  final List<Book> books;
  final int page;
  final bool isLoading;
  final bool hasMore;
  final bool noResults;
  final bool error;

  SearchBooksState copyWith({
    String? searchQuery,
    List<Book>? books,
    int? page,
    bool? isLoading,
    bool? hasMore,
    bool? noResults,
    bool? error,
  }) {
    return SearchBooksState(
      searchQuery: searchQuery ?? this.searchQuery,
      books: books ?? this.books,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      noResults: noResults ?? this.noResults,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    searchQuery,
    books,
    page,
    isLoading,
    hasMore,
    noResults,
    error,
  ];
}
