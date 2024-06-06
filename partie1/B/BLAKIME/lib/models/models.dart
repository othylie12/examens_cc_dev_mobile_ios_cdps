
class Chat {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      name: json['name'] ?? '',
      message: json['body'] ?? '',
      time: json['created_at'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',  
    );
  }
}
