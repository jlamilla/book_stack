import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class BookDetails extends HiveObject {

  BookDetails ({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    required this.pdf,
  });

  factory BookDetails.fromMap(Map<String, dynamic> map) {
    return BookDetails(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      authors: map['authors'] ?? '',
      publisher: map['publisher'] ?? '',
      isbn13: map['isbn13'] ?? '',
      pages: map['pages'] ?? '',
      year: map['year'] ?? '',
      rating: map['rating'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      url: map['url'] ?? '',
      pdf: (map['pdf'] as Map<String, dynamic>?)
            ?.map<String, String>((String key, dynamic value) => MapEntry<String, String>(key, value.toString())) ?? <String, String>{},
    );
  }
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String authors;
  @HiveField(3)
  final String publisher;
  @HiveField(4)
  final String isbn13;
  @HiveField(5)
  final String pages;
  @HiveField(6)
  final String year;
  @HiveField(7)
  final String rating;
  @HiveField(8)
  final String desc;
  @HiveField(9)
  final String price;
  @HiveField(10)
  final String image;
  @HiveField(11)
  final String url;
  @HiveField(12)
  final Map<String,String> pdf;

  static List<BookDetails> listFromMaps(List<dynamic> maps) {
    return maps.map((dynamic map) => BookDetails.fromMap(map)).toList();
  }
}
