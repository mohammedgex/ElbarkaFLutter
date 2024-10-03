class BannerModel {
  int id;
  List<String> images;
  DateTime createdAt;
  DateTime updatedAt;

  BannerModel({
    required this.id,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  // لتحويل JSON إلى BannerModel
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
