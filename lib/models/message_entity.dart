class MessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  MessageEntity(
      {required this.text,
      required this.id,
      required this.createdAt,
      required this.author,
      this.imageUrl});

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    if (json['imageUrl'] == null) {
      return MessageEntity(
          text: json['text'],
          id: json['id'],
          createdAt: json['createdAt'],
          author: Author.fromJson(json['author']));
    }
    return MessageEntity(
        text: json['text'],
        id: json['id'],
        createdAt: json['createdAt'],
        imageUrl: json['imageUrl'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String username;
  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username']);
  }
}
