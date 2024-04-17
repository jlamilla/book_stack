class GetSearchBooksBody {

  GetSearchBooksBody({
    required this.query,
    required this.page,
  });

  final String query;
  final int page;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'query': query,
        'page': page,
      };
}
