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
        pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(
          key: const ValueKey<String>('home'),
          child: const HomeScreen(),
          pushFrom: TransitionDirection.left,
          popTo: TransitionDirection.left,
        ),
      ),
      GoRoute(
        path: RoutesBookStack.bookDetails,
        pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(
          key: const ValueKey<String>('details'),
          child: const BookDetailsScreen(),
          pushFrom: TransitionDirection.right,
          popTo: TransitionDirection.right,
        ),
      ),
      GoRoute(
        path: RoutesBookStack.searchBooks,
        pageBuilder: (BuildContext context, GoRouterState state) => buildCustomTransitionPage(
          key: const ValueKey<String>('search'),
          child: const SearchBooksScreen(),
          pushFrom: TransitionDirection.right,
          popTo: TransitionDirection.right,
        ),
      ),
    ],
  );
}

/// Enum to define transition direction
enum TransitionDirection { left, right }

/// Returns the Offset for the given direction
Offset _getOffset(TransitionDirection direction) {
  switch (direction) {
    case TransitionDirection.left:
      return const Offset(-1, 0);
    case TransitionDirection.right:
      return const Offset(1, 0);
  }
}

/// Custom transition page builder with configurable direction
CustomTransitionPage<void> buildCustomTransitionPage({
  required Widget child,
  required LocalKey key,
  required TransitionDirection pushFrom,
  required TransitionDirection popTo,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      final Animation<Offset> inAnimation = Tween<Offset>(
        begin: _getOffset(pushFrom),
        end: Offset.zero,
      ).animate(animation);

      final Animation<Offset> outAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: _getOffset(popTo),
      ).animate(secondaryAnimation);

      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.status == AnimationStatus.reverse ? outAnimation : inAnimation,
          child: child,
        ),
      );
    },
  );
}
