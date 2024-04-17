import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/books/book_details_screen.dart';
import '../../presentation/screens/home_screen.dart';
import 'routers.dart';

abstract class Pages {
  static final GoRouter appRouter =
      GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: 'book_details',
      path: Routes.bookDetails,
      builder: (BuildContext context, GoRouterState state) {
        return const BookDetailsScreen();
      },
    ),
  ]);
}
