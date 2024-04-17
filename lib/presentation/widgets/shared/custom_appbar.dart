import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/provider/book_details_provider.dart';
import '../../../config/provider/books_new_provider.dart';
import '../../../config/provider/search_books_provider.dart';
import '../../../config/router/routers.dart';
import '../../../domain/entities/book.dart';
import '../../screens/books/search_books_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyles = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text('Books Antioquia', style: textStyles.headlineMedium),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              final SearchBooksProvider searchBooksProvider = context.read<SearchBooksProvider>();
              final BooksDetailsProvider booksDetailsProvider = context.read<BooksDetailsProvider>();
              final BooksNewProvider booksNewProvider = context.read<BooksNewProvider>();
              showSearch<Book?>(
                query: searchBooksProvider.searchQuery,
                context: context,
                delegate: SearchBookDelegate(
                  initialBooks: <Book>[],
                  searchBooks: searchBooksProvider.searchBooks)
              ).then((Book? book) async {
                searchBooksProvider.booksTemp = <Book>[];
                if (book == null) {
                  return;
                }
                await searchBooksProvider.createBookHistory(book).then(
                  (void value) {
                    booksNewProvider.getHistoryBooks();
                    booksDetailsProvider.bookID = book.isbn13;
                    context.go(Routes.bookDetails);
                  }
                );
              });
            },
            icon: const Icon(Icons.search))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
