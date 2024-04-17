import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/provider/book_details_provider.dart';
import '../../../config/router/routers.dart';
import '../../../domain/entities/book.dart';


class CardSwiper extends StatelessWidget {

  const CardSwiper({
    super.key, 
    required this.books
  });

  final List<Book> books;

  
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    if( books.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: books.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        autoplay: true,
        itemBuilder: ( _ , int index ) {
          final Book book = books[index];
          return GestureDetector(
            onTap: () {
              final BooksDetailsProvider booksDetailsProvider = context.read<BooksDetailsProvider>();
              booksDetailsProvider.bookID = book.isbn13;
              context.go(Routes.bookDetails);
            },
            child: Hero(
              tag: 'swiper-${ book.isbn13 }',
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: CachedNetworkImageProvider( book.image ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
