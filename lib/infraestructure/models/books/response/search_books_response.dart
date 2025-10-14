import 'package:book_stack/domain/entities/book/book.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_books_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchBooksResponse extends Equatable {
  const SearchBooksResponse({
    this.error = '0',
    this.total = '0',
    this.page = '1',
    this.books = const <Book>[],
  });

  factory SearchBooksResponse.fromJson(Map<String, dynamic> json) => _$SearchBooksResponseFromJson(json);

  @JsonKey(defaultValue: '0')
  final String error;

  @JsonKey(defaultValue: '0')
  final String total;

  @JsonKey(defaultValue: '1')
  final String page;

  @JsonKey(defaultValue: <Book>[])
  final List<Book> books;

  Map<String, dynamic> toJson() => _$SearchBooksResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[error, total, page, books];
}
