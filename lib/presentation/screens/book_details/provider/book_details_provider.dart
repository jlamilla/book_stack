import 'package:book_stack/config/errors/failures.dart';
import 'package:book_stack/config/injection_dependencies/use_cases_register.dart';
import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/domain/use_cases/get_book_details_use_case.dart';
import 'package:book_stack/infraestructure/datasources/local/book_stack_database.dart';
import 'package:book_stack/infraestructure/datasources/local/book_stack_database_provider.dart';
import 'package:book_stack/presentation/screens/book_details/provider/book_details_state.dart';
import 'package:book_stack/presentation/screens/home/provider/home_provider.dart';
import 'package:book_stack_design_system/designs/utils/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

final NotifierProvider<BookDetailsNotifier, BookDetailsState> bookDetailsProvider = NotifierProvider<BookDetailsNotifier, BookDetailsState>(BookDetailsNotifier.new);

class BookDetailsNotifier extends Notifier<BookDetailsState> {
  late final GetBookDetailsUseCase getBookDetailsUseCase;

  @override
  BookDetailsState build() {
    getBookDetailsUseCase = ref.read(getBookDetailsUseCaseProvider);
    return const BookDetailsState();
  }

  Future<void> fetchDetails(String id) async {
    if (id.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true, error: false);
    final Either<Failure, BookDetails> result = await getBookDetailsUseCase.call(id);
    result.fold(
      (Failure l) {
        BookStackLogger.error(l.toString());
        state = state.copyWith(isLoading: false, error: true);
      },
      (BookDetails r) async {
        final bool isFav = await isFavorite(r.isbn13);
        final int? localRating = await getLocalRating(r.isbn13);
        state = state.copyWith(
          bookDetails: r,
          isLoading: false,
          isFavorite: isFav,
          localRating: localRating,
          error: false,
        );
      },
    );
  }

  Future<int?> getLocalRating(String isbn13) async {
    final BookStackDatabase db = ref.read(driftDatabaseProvider);
    return db.getRating(isbn13);
  }

  Future<void> setLocalRating(String isbn13, int rating) async {
    final BookStackDatabase db = ref.read(driftDatabaseProvider);
    await db.setRating(isbn13, rating);
    state = state.copyWith(localRating: rating);
  }

  Future<void> toggleFavorite(BookDetails book) async {
    final BookStackDatabase db = ref.read(driftDatabaseProvider);
    final bool isFav = await db.isFavorite(book.isbn13);
    if (isFav) {
      await db.deleteFavoriteByIsbn13(book.isbn13);
      state = state.copyWith(isFavorite: false);
    } else {
      await db.insertFavorite(BookFavoritesCompanion(
        title: Value<String>(book.title),
        subtitle: Value<String?>(book.subtitle),
        isbn13: Value<String>(book.isbn13),
        price: Value<String?>(book.price),
        image: Value<String?>(book.image),
        url: Value<String?>(book.url),
      ));
      state = state.copyWith(isFavorite: true);
    }
    // Refresca favoritos en Home si está activo
    final HomeNotifier homeNotifier = ref.read(homeProvider.notifier);
    if (homeNotifier.state.isFavorite) {
      await homeNotifier.refreshFavorites();
    }
  }

  Future<bool> isFavorite(String isbn13) async {
    final BookStackDatabase db = ref.read(driftDatabaseProvider);
    return db.isFavorite(isbn13);
  }

  void clear() {
    state = const BookDetailsState();
  }

  void clearAndBack(BuildContext context) {
    clear();
    context.pop();
  }

  Future<void> openPdfUrl(String url) async {
    if (url.isEmpty) {
      BookStackLogger.error('URL de PDF vacía');
      return;
    }
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        BookStackLogger.error('No se pudo abrir el enlace: $url');
      }
    } catch (e) {
      BookStackLogger.error('URL inválida: $url');
      return;
    }
  }
}
