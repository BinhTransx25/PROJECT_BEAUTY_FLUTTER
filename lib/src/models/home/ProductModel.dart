class ProductResponse {
  final List<ProductModel> data;  

  ProductResponse({required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      data: (json['data'] as List).map((item) => ProductModel.fromJson(item)).toList(),  
    );
  }
}

class ProductModel {  
  final String code;
  final String name;
  final String slug;
  final String type;
  final String shortDescription;
  final String description;
  final int thumbnail;
  final double price;
  final double width;
  final double length;
  final double height;
  final int status;

  ProductModel({  
    required this.code,
    required this.name,
    required this.slug,
    required this.type,
    required this.shortDescription,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.width,
    required this.length,
    required this.height,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel( 
      code: json['code'],
      name: json['name'],
      slug: json['slug'],
      type: json['type'],
      shortDescription: json['short_description'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: (json['price'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      status: json['status'],
    );
  }
}