import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_details.g.dart';

@JsonSerializable()
class BookDetails extends Equatable {
  const BookDetails({
    this.error = '0',
    this.title = '',
    this.subtitle = '',
    this.authors = '',
    this.publisher = '',
    this.language = '',
    this.isbn10 = '',
    this.isbn13 = '',
    this.pages = '',
    this.year = '',
    this.rating = '',
    this.desc = '',
    this.price = '',
    this.image = '',
    this.url = '',
    this.pdf = const <String, String>{},
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) => _$BookDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsToJson(this);

  final String error;
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String language;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;
  final String url;
  final Map<String, String> pdf;

  @override
  List<Object?> get props => <Object?>[
    error,
    title,
    subtitle,
    authors,
    publisher,
    isbn10,
    isbn13,
    pages,
    year,
    rating,
    desc,
    price,
    image,
    url,
    pdf,
  ];
}
