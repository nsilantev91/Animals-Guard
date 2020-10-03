class Post {
  int id;

  final String title;
  final String body;
  final String picture;

  DateTime created_at;
  DateTime updated_at;

  Post({
    this.title = "",
    String this.body = "",
    String this.picture = "",
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        body = json["body"],
        picture = json["picture"],
        created_at = DateTime.parse(json["created_at"]),
        updated_at = DateTime.parse(json["updated_at"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "picture": picture,
        "created_at": created_at.toString(),
        "updated_at": updated_at.toString(),
      };
}