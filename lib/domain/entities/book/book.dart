import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable{

  const Book({
    this.title = '',
    this.subtitle = '',
    this.isbn13 = '',
    this.price = '',
    this.image = '',
    this.url = '',
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  static List<Book> listFromMaps(List<dynamic> maps) {
    return maps.map((dynamic map) => Book.fromJson(map as Map<String, dynamic>)).toList();
  }

  @override
  List<Object?> get props => <Object?>[
    title, 
    subtitle, 
    isbn13, 
    price, 
    image, 
    url,
  ];
}
