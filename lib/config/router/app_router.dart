import 'package:antio_books/presentation/screens/books/book_details_screen.dart';
import 'package:antio_books/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: "home",
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) => const BookDetailsScreen(),
        ),
      ]
    ),
  ]
);