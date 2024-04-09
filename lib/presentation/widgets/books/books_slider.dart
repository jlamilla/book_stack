import 'package:antio_books/config/provider/book_details_provider.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BookSlider extends StatelessWidget {
  final List<Book> books;
  final String? title;

  const BookSlider({
    super.key,
    required this.books,
    this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (_, int index) => _BookPoster(books[index],
                    '$title-$index-${books[index].isbn13}')),
          ),
        ],
      ),
    );
  }
}

class _BookPoster extends StatelessWidget {
  final Book book;
  final String heroId;

  const _BookPoster(this.book, this.heroId);

  @override
  Widget build(BuildContext context) {

    final bookDetailsProvider = Provider.of<BooksDetailsProvider>(context);
    
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await bookDetailsProvider.getBookDetails(book.isbn13);
              if(context.mounted){
                GoRouter.of(context).go('/details');
              }
            },
            child: Hero(
              tag: book.isbn13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(book.image),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
