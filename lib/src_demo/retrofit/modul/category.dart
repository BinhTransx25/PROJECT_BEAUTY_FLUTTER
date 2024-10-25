// lib/models/category.dart

class Category {
  final String id;
  final String name;
  final String icon;
  final String createAt;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.createAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      icon: json['icon'],
      createAt: json['createAt'],
    );
  }
}

class CategoryResponse {
  final int code;
  final String msg;
  final String status;
  final List<Category> data;

  CategoryResponse({
    required this.code,
    required this.msg,
    required this.status,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Category> categoryList = list.map((i) => Category.fromJson(i)).toList();
    return CategoryResponse(
      code: json['code'],
      msg: json['msg'],
      status: json['status'],
      data: categoryList,
    );
  }
}
