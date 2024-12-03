class NotiModel {
  final String id;
  final String title;
  final String content;
  final String link;
  final String customerId;
  final String icon;
  final String isSee;
  final String createdAt;
  NotiModel({
    required this.id,
    required this.title,
    required this.content,
    required this.link,
    required this.customerId,
    required this.icon,
    required this.isSee,
    required this.createdAt,
  });
  factory NotiModel.fromJson(Map<String, dynamic> json) {
    return NotiModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      link: json['link'] ?? '',
      customerId: json['customer_id'] ?? '',
      icon: json['icon'] ?? '',
      isSee: json['is_see'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
