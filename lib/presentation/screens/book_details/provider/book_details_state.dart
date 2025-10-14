import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:equatable/equatable.dart';

class BookDetailsState extends Equatable {
  const BookDetailsState({
    this.bookDetails,
    this.isLoading = false,
    this.isFavorite = false,
    this.localRating,
    this.error = false,
  });

  final BookDetails? bookDetails;
  final bool isLoading;
  final bool isFavorite;
  final int? localRating;
  final bool error;

  BookDetailsState copyWith({
    BookDetails? bookDetails,
    bool? isLoading,
    bool? isFavorite,
    int? localRating,
    bool? error,
  }) {
    return BookDetailsState(
      bookDetails: bookDetails ?? this.bookDetails,
      isLoading: isLoading ?? this.isLoading,
      isFavorite: isFavorite ?? this.isFavorite,
      localRating: localRating ?? this.localRating,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => <Object?>[bookDetails, isLoading, isFavorite, localRating, error];
}
