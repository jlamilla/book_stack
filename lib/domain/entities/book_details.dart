class BookDetails {
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;
  final String url;
  final Map<String,String> pdf;

  BookDetails({
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
            ?.map<String, String>((key, value) => MapEntry(key, value.toString())) ?? {},
    );
  }

  static List<BookDetails> listFromMaps(List<dynamic> maps) {
    return maps.map((map) => BookDetails.fromMap(map)).toList();
  }
}