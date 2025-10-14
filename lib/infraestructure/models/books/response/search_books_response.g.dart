// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_books_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBooksResponse _$SearchBooksResponseFromJson(Map<String, dynamic> json) =>
    SearchBooksResponse(
      error: json['error'] as String? ?? '0',
      total: json['total'] as String? ?? '0',
      page: json['page'] as String? ?? '1',
      books:
          (json['books'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SearchBooksResponseToJson(
  SearchBooksResponse instance,
) => <String, dynamic>{
  'error': instance.error,
  'total': instance.total,
  'page': instance.page,
  'books': instance.books.map((e) => e.toJson()).toList(),
};
