import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book.dart';

typedef SearchBooksCallback = Future<List<Book>> Function(String query);

class SearchBookDelegate extends SearchDelegate<Book?> {
  SearchBookDelegate({
    required this.searchBooks,
    required this.initialBooks,
  }) : super( searchFieldLabel: 'Search Books',);

  final SearchBooksCallback searchBooks;
  List<Book> initialBooks;
  final StreamController<List<Book>> debouncedBooks = StreamController<List<Book>>.broadcast();
  final StreamController<bool> isLoadingStream = StreamController<bool>.broadcast();
  Timer? _debounceTimer;

  void clearStreams() {
    debouncedBooks.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      final List<Book> books = await searchBooks(query);
      initialBooks = books;
      debouncedBooks.add(books);
      isLoadingStream.add(false);
    });
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder<List<Book>>(
      initialData: initialBooks,
      stream: debouncedBooks.stream,
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        final TextTheme textStyles = Theme.of(context).textTheme;
        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          final List<Book>? books = snapshot.data;
          return ListView.builder(
            itemCount: books!.length,
            itemBuilder: (BuildContext context, int index) => _BookItem(
              book: books[index],
              onBookSelected: (BuildContext context, Book book) {
                clearStreams();
                close(context, book);
              },
            ),
          );
        } else {
          return Center(
              child: Text('No books found for your search',
                  style: textStyles.titleLarge));
        }
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      StreamBuilder<bool>(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 2),
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
  const _BookItem({required this.book, required this.onBookSelected});
  final Book book;
  final void Function( BuildContext, Book) onBookSelected;

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyles = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onBookSelected( context, book);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: <Widget>[
            // Image
            SizedBox(
              width: size.width * 0.2,
              height: size.height * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage(
                    'assets/no-image.jpg',
                  ),
                  image: CachedNetworkImageProvider(book.image),
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
                children: <Widget>[
                  Text(book.title, style: textStyles.titleMedium),
                  if (book.subtitle.length > 100) Text('${book.subtitle.substring(0, 100)}...') else Text(book.subtitle),
                  Text(
                    book.price,
                    style: textStyles.bodyMedium!
                        .copyWith(color: Colors.yellow.shade900),
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
