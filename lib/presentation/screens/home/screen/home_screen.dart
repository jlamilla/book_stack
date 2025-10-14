import 'package:book_stack/config/services/theme.dart';
import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/presentation/screens/home/provider/home_provider.dart';
import 'package:book_stack/presentation/screens/home/provider/home_state.dart';
import 'package:book_stack_design_system/designs/atomic/organisms/headers/header_book_stack.dart';
import 'package:book_stack_design_system/designs/atomic/templates/body/scaffold_book_stack.dart';
import 'package:book_stack_design_system/designs/atomic/templates/books/books_list_info_template/books_list_info_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() => ref.read(homeProvider.notifier).loadInitial());
  }

  RouteObserver<ModalRoute<void>>? _routeObserver;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver ??= ModalRoute.of(context)?.navigator?.widget.observers
        .whereType<RouteObserver<ModalRoute<void>>>()
        .firstOrNull;
    _routeObserver?.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    _routeObserver?.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    final HomeNotifier notifier = ref.read(homeProvider.notifier);
    final HomeState homeState = ref.read(homeProvider);
    if (homeState.isFavorite) {
      notifier.refreshFavorites();
    }
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState homeState = ref.watch(homeProvider);
    final HomeNotifier notifier = ref.read(homeProvider.notifier);
    final ThemeNotifier themeNotifier = ref.read(themeNotifierProvider.notifier);

    return ScaffoldBookStack(
      header: HeaderBookStack(
        key: const Key('home_screen_header'),
        type: HeaderType.home,
        onSearch: () => notifier.goToSearchBooks(context),
        onToggleTheme: themeNotifier.toggleTheme,
      ),
      body: BooksListInfoTemplate<Book>(
        key: const Key('home_screen_book_list'),
        booksList: homeState.books,
        hasMore: homeState.hasMore,
        isFavorite: homeState.isFavorite,
        visibilityFavorite: true,
        error: homeState.error,
        visibilitySorts: homeState.isFavorite,
        isLoading: homeState.isLoading,
        sortOptions: const <String>[
          'Price Ascending',
          'Price Descending',
        ],
        onSortChanged: notifier.onSortChanged,
        onTapFavorites: notifier.toggleFavorites,
        onLoadMore: notifier.onLoadMore,
        onTapDetailsBook: (Book book) => notifier.goToDetails(context, book),
        getIdBook: (Book book) => book.isbn13,
        getTitleBook: (Book book) => book.title,
        getSubTitleBook: (Book book) => book.subtitle,
        getImageUrlBook: (Book book) => book.image,
        getPriceBook: (Book book) => book.price,
      ),
    );
  }
}
