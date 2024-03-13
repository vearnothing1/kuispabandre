class New {
  final String author;
  final String title;

  New({
    required this.author,
    required this.title,
  });

  factory New.fromJson(Map<String, dynamic> json) {
    return New(
      author: json['author'] ?? 0,
      title: json['title'] ?? 0,
    );
  }
}
