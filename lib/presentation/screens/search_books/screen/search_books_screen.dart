import 'package:book_stack/domain/entities/book/book.dart';
import 'package:book_stack/presentation/screens/search_books/provider/search_books_provider.dart';
import 'package:book_stack/presentation/screens/search_books/provider/search_books_state.dart';
import 'package:book_stack_design_system/designs/atomic/atoms/inputs/book_stack_search.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/cards/card_image_description.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/informative_components/informative_component.dart';
import 'package:book_stack_design_system/designs/atomic/organisms/headers/header_book_stack.dart';
import 'package:book_stack_design_system/designs/atomic/templates/body/scaffold_book_stack.dart';
import 'package:book_stack_design_system/designs/atomic/templates/books/books_list_info_template/books_list_info_template.dart';
import 'package:book_stack_design_system/designs/atomic/templates/books/books_list_info_template/books_list_info_template_style.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBooksScreen extends ConsumerStatefulWidget {
  const SearchBooksScreen({super.key});

  @override
  ConsumerState<SearchBooksScreen> createState() => _SearchBooksScreenState();
}

class _SearchBooksScreenState extends ConsumerState<SearchBooksScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final SearchBooksState state = ref.read(searchBooksProvider);
    _controller = TextEditingController(text: state.searchQuery);
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    ref.read(searchBooksProvider.notifier).setSearchQuery(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchBooksState state = ref.watch(searchBooksProvider);
    final SearchBooksNotifier notifier = ref.read(searchBooksProvider.notifier);

    return ScaffoldBookStack(
      header: HeaderBookStack(
        type: HeaderType.search,
        onBack: () {
          _focusNode.unfocus();
          _controller.clear();
          notifier.clearAndGoHome(context);
        },
        textSearch: BookStackSearch(
          controller: _controller,
          focusNode: _focusNode,
          onTapClear: () {
            _controller.clear();
            _focusNode.unfocus();
            ref.read(searchBooksProvider.notifier).clear();
          },
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (_controller.text.isEmpty && !state.isLoading && !state.error) {
            return const InformativeComponent(
              type: InformativeComponentType.search,
              title: 'Search for books',
              subTitle: 'Enter a title or author to begin',
            );
          }
          if (state.error) {
            return const InformativeComponent(
              type: InformativeComponentType.error,
            );
          }
          if (state.noResults) {
            return const InformativeComponent(
              type: InformativeComponentType.search,
            );
          }
          return BooksListInfoTemplate<Book>(
            key: const Key('search_books_list_info_template'),
            isLoading: state.isLoading,
            crossAxisCount: 1,
            booksList: state.books,
            hasMore: state.hasMore,
            getIdBook: (Book book) => book.isbn13,
            getTitleBook: (Book book) => book.title,
            getSubTitleBook: (Book book) => book.subtitle,
            getImageUrlBook: (Book book) => book.image,
            getPriceBook: (Book book) => book.price,
            onLoadMore: () async {
              await notifier.loadMore();
              return state.books;
            },
            onTapDetailsBook: (Book book) {
              _focusNode.unfocus();
              notifier.goToDetails(context, book);
            },
            style: BooksListInfoTemplateStyle(
              imagePosition: CardImagePosition.left,
              imageWidth: BookStackScreenSize.width(context, 100),
              childAspectRatio: 2.5,
              paddingContent: EdgeInsets.zero,
              paddingDescription: BookStackScreenSize.fromLTRB(
                context,
                top: 20,
                right: 20,
              ),
              paddingImage: BookStackScreenSize.all(context, 3),
            ),
          );
        },
      ),
    );
  }
}
