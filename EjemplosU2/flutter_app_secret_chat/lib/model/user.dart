class User {
  final String id;
  final String username;
  final String email;
  final DateTime createAt;
  final DateTime updateAt;

  User({this.id, this.username, this.email, this.createAt, this.updateAt});

  factory User.fromJson(Map<String, dynamic> json) {
    final createAt = DateTime.parse(json['createdAt']);
    final updateAt = DateTime.parse(json['updatedAt']);
    return User(
      id: json['createdAt'],
      username: json['createdAt'],
      email: json['createdAt'],
      createAt: createAt,
      updateAt: updateAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": this.id,
      "email": this.email,
      "username": username,
      "createdAt": createAt.toString(),
      "updatedAt": updateAt.toString(),
    };
  }

}
