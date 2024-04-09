import 'package:antio_books/config/injection_dependencies/injection_container.dart';
import 'package:antio_books/config/provider/book_details_provider.dart';
import 'package:antio_books/config/provider/search_books_provider.dart';
import 'package:antio_books/config/provider/books_new_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersUseCase = [
  ChangeNotifierProvider(create: (_) => BooksNewProvider(getBooksNewUseCase: sl()), lazy: false,),
  ChangeNotifierProvider(create: (_) => SearchBooksProvider(getSearchBooksUseCase: sl()), lazy: false,),
  ChangeNotifierProvider(create: (_) => BooksDetailsProvider(getBookDetailsUseCase: sl()), lazy: false,),
];