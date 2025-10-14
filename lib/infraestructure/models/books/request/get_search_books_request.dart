import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_search_books_request.g.dart';

@JsonSerializable()
class GetSearchBooksRequest extends Equatable {

  const GetSearchBooksRequest({
    required this.query,
    required this.page,
  });

  factory GetSearchBooksRequest.fromJson(Map<String, dynamic> json) => _$GetSearchBooksRequestFromJson(json);

  final String query;
  final int page;

  Map<String, dynamic> toJson() => _$GetSearchBooksRequestToJson(this);

  @override
  List<Object?> get props => <Object?>[query, page];
}
