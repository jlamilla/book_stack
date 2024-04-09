import 'dart:async';
import 'package:antio_books/domain/entities/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

typedef SearchBooksCallback = Future<List<Book>> Function(String query);

class SearchBookDelegate extends SearchDelegate<Book?> {
  final SearchBooksCallback searchBooks;
  List<Book> initialBooks;
  StreamController<List<Book>> debouncedBooks = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchBookDelegate({
    required this.searchBooks,
    required this.initialBooks,
  }) : super(
          searchFieldLabel: 'Search Books',
        );

  void clearStreams() {
    debouncedBooks.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final books = await searchBooks(query);
      initialBooks = books;
      debouncedBooks.add(books);
      isLoadingStream.add(false);
    });
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      initialData: initialBooks,
      stream: debouncedBooks.stream,
      builder: (context, snapshot) {
        final textStyles = Theme.of(context).textTheme;
        if(snapshot.data != null && snapshot.data!.isNotEmpty){
          final books = snapshot.data;
          return ListView.builder(
            itemCount: books!.length,
            itemBuilder: (context, index) => _BookItem(
              book: books[index],
              onBookSelected: (context, Book book) {
                clearStreams();
                close(context, book);
              },
            ),
          );
        }else{
          return Center(child: Text('No books found for your search', style: textStyles.titleLarge));
        }
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 20),
              spins: 10,
              infinite: true,
              child: IconButton(
                  onPressed: () => query = '',
                  icon: const Icon(Icons.refresh_rounded)),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
                onPressed: () => query = '', icon: const Icon(Icons.clear)),
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _BookItem extends StatelessWidget {
  final Book book;
  final Function onBookSelected;

  const _BookItem({required this.book, required this.onBookSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onBookSelected(context, book);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: size.width * 0.2,
              height: size.height * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder:  const AssetImage('assets/no-image.jpg',),
                  image: CachedNetworkImageProvider( book.image ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Description
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: textStyles.titleMedium),
                  (book.subtitle.length > 100)
                      ? Text('${book.subtitle.substring(0, 100)}...')
                      : Text(book.subtitle),
                  Text( book.price, style: textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
