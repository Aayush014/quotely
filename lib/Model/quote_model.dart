class Quotes {
  final String quote;
  final String author;
  final String? category;
  int index;
  bool isLike;

  Quotes(
      {required this.quote,
      required this.author,
      this.category,
      required this.index,
      required this.isLike});

  factory Quotes.fromMap(int index, Map map) {
    return Quotes(
        quote: map['quote'],
        author: map['author'],
        category: map['category'],
        index: index,
        isLike: false);
  }
}
