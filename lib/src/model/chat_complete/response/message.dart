class Message {
  final String role;
  final String content;
  final String id = "${DateTime.now().millisecondsSinceEpoch}";

  Message({required this.role, required this.content});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"] ?? "",
        content: json["content"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}
