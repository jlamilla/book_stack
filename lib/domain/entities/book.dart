
import 'package:hive_flutter/hive_flutter.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book extends HiveObject {

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory Book.fromMap(Map<String, dynamic> map) {//?- mejorar esto para generalizarlo.
    return Book(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      isbn13: map['isbn13'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
      url: map['url'] ?? '',
    );
  }

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String isbn13;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String url;

  static List<Book> listFromMaps(List<dynamic> maps) {
    return maps.map((dynamic map) => Book.fromMap(map)).toList();
  }
}
