class MessageType {
  static const image = "image";
  static const text = "text";
}

class Message {
  final String id;
  final String username;
  final String message;
  final String type;
  final DateTime createAt;

  Message(
      {this.id,
      this.username,
      this.message,
      this.type = MessageType.text,
      this.createAt});
}
