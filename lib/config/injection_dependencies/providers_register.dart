import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/book_details_provider.dart';
import '../provider/books_new_provider.dart';
import '../provider/search_books_provider.dart';
import 'injection_container.dart';

List<SingleChildWidget> providersUseCase = <SingleChildWidget>[
  ChangeNotifierProvider<BooksNewProvider>(create: (_) => BooksNewProvider(getBooksNewUseCase: sl()), lazy: false,),
  ChangeNotifierProvider<SearchBooksProvider>(create: (_) => SearchBooksProvider(getSearchBooksUseCase: sl()), lazy: false,),
  ChangeNotifierProvider<BooksDetailsProvider> (create: (_) => BooksDetailsProvider(getBookDetailsUseCase: sl()), lazy: false,),
];
