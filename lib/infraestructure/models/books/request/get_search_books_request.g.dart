// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search_books_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchBooksRequest _$GetSearchBooksRequestFromJson(
  Map<String, dynamic> json,
) => GetSearchBooksRequest(
  query: json['query'] as String,
  page: (json['page'] as num).toInt(),
);

Map<String, dynamic> _$GetSearchBooksRequestToJson(
  GetSearchBooksRequest instance,
) => <String, dynamic>{'query': instance.query, 'page': instance.page};
