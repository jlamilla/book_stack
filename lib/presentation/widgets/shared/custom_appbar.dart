import 'package:antio_books/config/provider/book_details_provider.dart';
import 'package:antio_books/config/provider/books_new_provider.dart';
import 'package:antio_books/config/provider/search_books_provider.dart';
import 'package:antio_books/domain/entities/book.dart';
import 'package:antio_books/presentation/screens/books/search_books_delegate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon( Icons.book_outlined, color: colors.primary ),
              const SizedBox( width: 5 ),
              Text('Books Antioquia', style: titleStyle ),
              const Spacer(),
              IconButton(onPressed: () {
                final searchBooksProvider = context.read<SearchBooksProvider>();
                final booksDetailsProvider = context.read<BooksDetailsProvider>();
                final booksNewProvider = context.read<BooksNewProvider>();
                showSearch<Book?>(
                  query: searchBooksProvider.searchQuery,
                  context: context, 
                  delegate: SearchBookDelegate(
                    initialBooks: [],
                    searchBooks: searchBooksProvider.searchBooks 
                  )
                ).then((book) async{
                    searchBooksProvider.booksTemp = [];
                  if ( book == null ) return;
                    await booksDetailsProvider.getBookDetails(book.isbn13);
                    await searchBooksProvider.createBookHistory(book);
                    booksNewProvider.getHistoryBooks();
                    if(context.mounted){
                      GoRouter.of(context).go('/details');
                    }
                });
              }, 
              icon: const Icon(Icons.search)
              )
            ],
          ),
        ),
      )
    );
  }
}