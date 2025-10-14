import 'package:book_stack/config/router/routers.dart';
import 'package:book_stack/presentation/screens/book_details/screen/book_details_screen.dart';
import 'package:book_stack/presentation/screens/home/screen/home_screen.dart';
import 'package:book_stack/presentation/screens/search_books/screen/search_books_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Pages {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: RoutesBookStack.home,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildTransitionPage(
          key: const ValueKey<String>('home'),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: RoutesBookStack.bookDetails,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildTransitionPage(
          key: const ValueKey<String>('details'),
          child: const BookDetailsScreen(),
        ),
      ),
      GoRoute(
        path: RoutesBookStack.searchBooks,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildTransitionPage(
          key: const ValueKey<String>('search'),
          child: const SearchBooksScreen(),
        ),
      ),
    ],
  );
}

CustomTransitionPage<void> _buildTransitionPage({
  required Widget child,
  required LocalKey key,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );
    },
  );
}
