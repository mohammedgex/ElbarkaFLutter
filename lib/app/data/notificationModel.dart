class notificationModel {
  int? id;
  int? userId;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;

  notificationModel(
      {this.id,
      this.userId,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt});

  notificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['content'] = content;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
