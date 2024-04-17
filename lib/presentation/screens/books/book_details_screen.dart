import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/provider/book_details_provider.dart';
import '../../../config/router/routers.dart';
import '../../../domain/entities/book_details.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    context.read<BooksDetailsProvider>().getBookDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BooksDetailsProvider booksDetailsProvider =
        context.watch<BooksDetailsProvider>();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          leading: IconButton(
              onPressed: () {
                context.read<BooksDetailsProvider>().clear();
                context.go(Routes.home);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: booksDetailsProvider.bookDetails != null
            ? _BookDetails(
                bookDetails: booksDetailsProvider.bookDetails!,
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.grey[600],
              )));
  }
}

class _BookDetails extends StatelessWidget {
  const _BookDetails({required this.bookDetails});

  final BookDetails bookDetails;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textStyles = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.85,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(4, 4),
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: CachedNetworkImageProvider(bookDetails.image),
                  fit: BoxFit.fill,
                  height: 300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Icon>.generate(
                      int.parse(bookDetails.rating),
                      (int index) => Icon(Icons.star,
                          color: Colors.yellow.shade900, size: 25),
                    ) +
                    List<Icon>.generate(
                      5 - int.parse(bookDetails.rating),
                      (int index) => Icon(Icons.star,
                          color: Colors.grey.shade500, size: 25),
                    ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(bookDetails.title, style: textStyles.titleLarge),
                    const SizedBox(height: 10),
                    if (bookDetails.subtitle != '')
                      Text(bookDetails.subtitle, style: textStyles.titleMedium),
                    const SizedBox(height: 10),
                    Text('Authors: ${bookDetails.authors}',
                        style: textStyles.bodyMedium),
                    const SizedBox(height: 5),
                    Text('Publisher: ${bookDetails.publisher}',
                        style: textStyles.bodyMedium),
                    const SizedBox(height: 5),
                    Text('Year: ${bookDetails.year}'),
                    const SizedBox(height: 10),
                    Text(bookDetails.desc, style: textStyles.bodySmall),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          bookDetails.price,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Pag. ${bookDetails.pages}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (bookDetails.pdf.entries.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          children: <Widget>[
                            Text('Read book', style: textStyles.titleMedium),
                            Wrap(
                              children: bookDetails.pdf.entries
                                  .map((MapEntry<String, String> entry) {
                                final String key = entry.key;
                                return GestureDetector(
                                  onTap: () {
                                  },
                                  child: Chip(
                                    label: Text(key),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
