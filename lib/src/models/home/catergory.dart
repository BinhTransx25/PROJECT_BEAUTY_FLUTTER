class Category {
  final int storeId;
  final int? parentId;
  final int id;
  final String code;
  final String lang;
  final String name;
  final String slug;
  final int imageId;
  final int isActive;
  // final int isOutstanding;
  // final String? file;
  // final Store store;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.storeId,
     this.parentId,
    required this.id,
    required this.code,
    required this.lang,
    required this.name,
    required this.slug,
    required this.imageId,
    required this.isActive,
    // required this.isOutstanding,
    // this.file,
    // required this.store,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      storeId: json['store_id'],
      parentId: json['parent_id'],
      id: json['id'],
      code: json['code'],
      lang: json['lang'],
      name: json['name'],
      slug: json['slug'],
      imageId: json['image_id'],
      isActive: json['is_active'],
      // isOutstanding: json['is_outstanding'],
      // file: json['file'],
      // store: Store.fromJson(json['store']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'store_id': storeId,
      'parent_id': parentId,
      'id': id,
      'code': code,
      'lang': lang,
      'name': name,
      'slug': slug,
      'image_id': imageId,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

// class Store {
//   final int id;
//   final String storeToken;
//   final String code;
//   final String name;
//   final String address;
//   final String phone;
//   final String status;
//   final int companyId;
//   final String createdAt;
//   final String updatedAt;

//   Store({
//     required this.id,
//     required this.storeToken,
//     required this.code,
//     required this.name,
//     required this.address,
//     required this.phone,
//     required this.status,
//     required this.companyId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Store.fromJson(Map<String, 
//dynamic> json) {
//     return Store(
//       id: json['id'],
//       storeToken: json['store_token'],
//       code: json['code'],
//       name: json['name'],
//       address: json['address'],
//       phone: json['phone'],
//       status: json['status'],
//       companyId: json['companyId'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'store_token': storeToken,
//       'code': code,
//       'name': name,
//       'address': address,
//       'phone': phone,
//       'status': status,
//       'companyId': companyId,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }
