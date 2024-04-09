import 'package:animate_do/animate_do.dart';
import 'package:antio_books/config/provider/book_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatelessWidget {

  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => const _BookDetails(),
            childCount: 1
          ))
        ],
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  const _BookDetails();


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    final bookDetails = context.watch<BooksDetailsProvider>().bookDetails!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      bookDetails.image,
                      width: size.width * 0.3,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      int.parse(bookDetails.rating),
                      (index) => Icon(Icons.star, color: Colors.yellow.shade900 , size: 16),
                    ) +
                    List.generate(
                      5 - int.parse(bookDetails.rating),
                      (index) => Icon(Icons.star, color: Colors.grey.shade500, size: 16),
                    ),
                  ),  
                  Text( 'Pages: ${bookDetails.pages}'),
                  Text( 'Price: ${bookDetails.price}'),
                ],
              ),
              const SizedBox( width: 10 ),
              // Descripción
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( bookDetails.title, style: textStyles.titleLarge ),
                    const SizedBox( height: 10 ),
                    if(bookDetails.subtitle!='') Text( bookDetails.subtitle, style: textStyles.titleMedium),
                    const SizedBox( height: 10 ),
                    Text( "Authors: ${bookDetails.authors}", style: textStyles.bodyMedium ),
                    const SizedBox( height: 5 ),
                    Text( "Publisher: ${bookDetails.publisher}", style: textStyles.bodyMedium ),
                    const SizedBox( height: 5 ),
                    Text( 'Year: ${bookDetails.year}'),
                    const SizedBox( height: 10 ),
                    Text( bookDetails.desc, style: textStyles.bodySmall),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: bookDetails.pdf.entries.map((entry) {
              final String key = entry.key;
              return GestureDetector(
                onTap: () {
                  //todo implementar view para ver el pdf url $value
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(key),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 50 ),
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {


  const CustomSliverAppBar({super.key,});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final bookDetails = context.watch<BooksDetailsProvider>().bookDetails!;

    return SliverAppBar(
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.black54,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                bookDetails.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if ( loadingProgress != null ) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black87
                    ]
                  )
                )
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.4],
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ]
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
