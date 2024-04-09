import 'package:antio_books/config/provider/book_details_provider.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class CardSwiper extends StatelessWidget {

  final List<Book> books;

  const CardSwiper({
    super.key, 
    required this.books
  });

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final bookDetailsProvider = Provider.of<BooksDetailsProvider>(context);

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
          final book = books[index];
          final id = 'swiper-${ book.isbn13 }';
          return GestureDetector(
            onTap: () async {
              await bookDetailsProvider.getBookDetails(book.isbn13);
              if(context.mounted){
                GoRouter.of(context).go('/details');
              }
            },
            child: Hero(
              tag: id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: CachedNetworkImageProvider( book.image ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}