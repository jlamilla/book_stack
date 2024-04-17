import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/provider/books_new_provider.dart';
import '../widgets/books/books_slider.dart';
import '../widgets/books/card_swiper.dart';
import '../widgets/shared/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BooksNewProvider booksNewProvider = context.watch<BooksNewProvider>();

    return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        body: Column(
            children: <Widget>[
              CardSwiper(books: booksNewProvider.booksNews),
              BookSlider(
                books: booksNewProvider.historyBooks,
              ),
            ],
        )
      ),
    );
  }
}
