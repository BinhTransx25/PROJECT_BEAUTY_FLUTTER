class BannerModel {
  final int id;
  final String code;
  final String title;
  final String description;
  final String backgroundColor;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;

  BannerModel({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      code: json['code'],
      title: json['title'],
      description: json['description'],
      backgroundColor: json['background_color'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}