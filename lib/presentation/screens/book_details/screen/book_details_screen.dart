import 'package:book_stack/domain/entities/book/book_details.dart';
import 'package:book_stack/presentation/screens/book_details/provider/book_details_provider.dart';
import 'package:book_stack/presentation/screens/book_details/provider/book_details_state.dart';
import 'package:book_stack_design_system/designs/atomic/atoms/skeletons/skeleton_card.dart';
import 'package:book_stack_design_system/designs/atomic/molecules/informative_components/informative_component.dart';
import 'package:book_stack_design_system/designs/atomic/organisms/headers/header_book_stack.dart';
import 'package:book_stack_design_system/designs/atomic/templates/body/scaffold_book_stack.dart';
import 'package:book_stack_design_system/designs/atomic/templates/books/book_details_template/book_details_template.dart';
import 'package:book_stack_design_system/designs/responsive/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookDetailsScreen extends ConsumerStatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  ConsumerState<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.microtask(() {
      if (!mounted) {
        return;
      }
      final String? id = GoRouterState.of(context).uri.queryParameters['id'];
      if (id != null && id.isNotEmpty) {
        ref.read(bookDetailsProvider.notifier).fetchDetails(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final BookDetailsState state = ref.watch(bookDetailsProvider);
    final BookDetailsNotifier notifier = ref.read(bookDetailsProvider.notifier);

    return ScaffoldBookStack(
      key: const Key('book_details_screen_scaffold'),
      header: HeaderBookStack(
        key: const Key('book_details_screen_header'),
        type: HeaderType.module,
        title: 'Book details',
        onBack: () => notifier.clearAndBack(context),
      ),
      body: Builder(
        builder: (BuildContext context) {
          if ((state.isLoading || state.bookDetails == null) && !state.error) {
            return Center(
              child: Padding(
                padding: BookStackScreenSize.fromLTRB(
                  context,
                  left: 24,
                  top: 60 + MediaQuery.of(context).padding.top,
                  right: 24,
                  bottom: 24,
                ),
                child: SkeletonCard(
                  key: const Key('book_details_screen_skeleton'),
                  width: BookStackScreenSize.screenWidth(context) * 0.8,
                  height: BookStackScreenSize.screenHeight(context) * 0.8,
                ),
              ),
            );
          }
          if (state.error) {
            return const InformativeComponent(
              title: 'Error loading book details',
              subTitle: 'Please try again later',
              type: InformativeComponentType.error,
            );
          }
          final BookDetails bookDetails = state.bookDetails!;
          return BookDetailsTemplate(
            key: const Key('book_details_screen_body'),
            title: bookDetails.title,
            author: bookDetails.authors,
            image: bookDetails.image,
            price: bookDetails.price,
            publisher: bookDetails.publisher,
            language: bookDetails.language,
            pages: bookDetails.pages,
            year: bookDetails.year,
            description: bookDetails.desc,
            pdfs: bookDetails.pdf,
            initialRating: int.tryParse(bookDetails.rating) ?? 0,
            isFavorite: state.isFavorite,
            localRating: state.localRating,
            onBack: () => notifier.clearAndBack(context),
            onTapPDFs: (String pdfUrl) => notifier.openPdfUrl(pdfUrl),
            onRatingChange: (int rating) async {
              await notifier.setLocalRating(bookDetails.isbn13, rating);
            },
            onToggleFavorite: () async {
              await notifier.toggleFavorite(bookDetails);
            },
          );
        },
      ),
    );
  }
}
