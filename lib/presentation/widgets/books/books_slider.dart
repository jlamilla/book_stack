import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/provider/book_details_provider.dart';
import '../../../config/router/routers.dart';
import '../../../domain/entities/book.dart';

class BookSlider extends StatelessWidget {
  const BookSlider({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {

    final TextTheme textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              'Recently viewed bookse',
              style: textStyles.titleLarge,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (_, int index) => _BookPoster(
                    books[index], '$index-${books[index].isbn13}')),
          ),
        ],
      ),
    );
  }
}

class _BookPoster extends StatelessWidget {
  const _BookPoster(this.book, this.heroId);

  final Book book;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9), // Color con desenfoque
            backgroundBlendMode: BlendMode.srcOver,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1,
              )
            ]),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  final BooksDetailsProvider booksDetailsProvider =
                      context.read<BooksDetailsProvider>();
                  booksDetailsProvider.bookID = book.isbn13;
                  context.go(Routes.bookDetails);
                },
                child: Hero(
                  tag: book.isbn13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: CachedNetworkImageProvider(book.image),
                      fit: BoxFit.fill,
                      height: 140,
                      width: 180,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: 120,
                child: Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
