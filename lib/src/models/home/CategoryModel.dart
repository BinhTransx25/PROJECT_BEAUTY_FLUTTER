class CategoryModel {
  final int id;
  final String name;
  final String code;
  final String slug;
  final int isActive;
  final int? storeId;
  final int? parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.slug,
    required this.isActive,
    this.storeId,
    this.parentId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      slug: json['slug'],
      isActive: json['is_active'],
      storeId: json['store_id'],
      parentId: json['parent_id'],
    );
  }
}