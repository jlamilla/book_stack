import 'package:antio_books/config/provider/books_new_provider.dart';
import 'package:antio_books/presentation/widgets/books/card_swiper.dart';
import 'package:antio_books/presentation/widgets/books/books_slider.dart';
import 'package:antio_books/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booksNewProvider = Provider.of<BooksNewProvider>(context);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppbar(),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  CardSwiper(books: booksNewProvider.booksNews),
                  BookSlider(
                    books: booksNewProvider.historyBooks,
                    title: 'Recently viewed bookse',
                  ),
                ],
              );
            }, childCount: 1)),
    ]));
  }
}
