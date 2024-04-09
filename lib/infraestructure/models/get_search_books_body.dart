class GetSearchBooksBody {
  final String query;
  final int page;

  GetSearchBooksBody({
    required this.query,
    required this.page,
  });

  Map<String, dynamic> toJson() => {
        "query": query,
        "page": page,
      };
}
