// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) => BookDetails(
  error: json['error'] as String? ?? '0',
  title: json['title'] as String? ?? '',
  subtitle: json['subtitle'] as String? ?? '',
  authors: json['authors'] as String? ?? '',
  publisher: json['publisher'] as String? ?? '',
  language: json['language'] as String? ?? '',
  isbn10: json['isbn10'] as String? ?? '',
  isbn13: json['isbn13'] as String? ?? '',
  pages: json['pages'] as String? ?? '',
  year: json['year'] as String? ?? '',
  rating: json['rating'] as String? ?? '',
  desc: json['desc'] as String? ?? '',
  price: json['price'] as String? ?? '',
  image: json['image'] as String? ?? '',
  url: json['url'] as String? ?? '',
  pdf:
      (json['pdf'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const <String, String>{},
);

Map<String, dynamic> _$BookDetailsToJson(BookDetails instance) =>
    <String, dynamic>{
      'error': instance.error,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'language': instance.language,
      'isbn10': instance.isbn10,
      'isbn13': instance.isbn13,
      'pages': instance.pages,
      'year': instance.year,
      'rating': instance.rating,
      'desc': instance.desc,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
      'pdf': instance.pdf,
    };
