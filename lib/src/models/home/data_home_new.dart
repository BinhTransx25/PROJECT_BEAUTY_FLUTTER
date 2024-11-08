// data.dart

final List<String> carouselImages = [
  'lib/src/assets/Home/anh1.png',
  'lib/src/assets/Home/anh2.png',
  'lib/src/assets/Home/anh3.png',
  'lib/src/assets/Home/anh4.png',
  'lib/src/assets/Home/anh5.png',
];

class Promotion {
  final String imageUrl;
  final String name;

  Promotion({required this.imageUrl, required this.name});
}

List<Promotion> promotions = [
  Promotion(
    imageUrl: 'lib/src/assets/Home/coupon.png',
    name: 'Mã giảm giá',
  ),
  Promotion(
    imageUrl: 'lib/src/assets/Home/donation.png',
    name: 'Ưu đãi Combo',
  ),
  Promotion(
    imageUrl: 'lib/src/assets/Home/refund.png',
    name: 'Hoàn tiền',
  ),
  Promotion(
    imageUrl: 'lib/src/assets/Home/freeshipping.png',
    name: 'Free ship',
  ),
];

class Category {
  final String name;
  final String iconImage;

  Category({required this.name, required this.iconImage});
}

List<Category> categories = [
  Category(name: 'Son', iconImage: 'lib/src/assets/Home/son.png'),
  Category(name: 'Tẩy trang', iconImage: 'lib/src/assets/Home/taytrang.png'),
  Category(name: 'Dưỡng ẩm', iconImage: 'lib/src/assets/Home/duongam.png'),
  Category(name: 'Mặt nạ bùn', iconImage: 'lib/src/assets/Home/matnabun.png'),
  Category(name: 'Lột mụn', iconImage: 'lib/src/assets/Home/lotmun.png'),
];

class OutstandingProduct {
  final String imageUrl;
  final String name;
  final double originalPrice;
  final double discountedPrice;

  OutstandingProduct({
    required this.imageUrl,
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
  });
}

List<OutstandingProduct> outstandingProducts = [
  OutstandingProduct(
    imageUrl: 'lib/src/assets/Home/sp1.png',
    name: 'Son LOreal',
    originalPrice: 15000,
    discountedPrice: 12000,
  ),
  OutstandingProduct(
    imageUrl: 'lib/src/assets/Home/sp2.png',
    name: 'Serum LOreal',
    originalPrice: 25000,
    discountedPrice: 20000,
  ),
  OutstandingProduct(
    imageUrl: 'lib/src/assets/Home/sp3.png',
    name: 'Mực LOreal',
    originalPrice: 30000,
    discountedPrice: 25000,
  ),
  OutstandingProduct(
    imageUrl: 'lib/src/assets/Home/sp4.png',
    name: 'Phấn LOreal',
    originalPrice: 30000,
    discountedPrice: 25000,
  ),
];

class OutstandingProductSale {
  final String imageUrl;
  final String name;
  final double originalPrice;
  final double discountedPrice;
  final String sale;

  OutstandingProductSale({
    required this.imageUrl,
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
    required this.sale,
  });
}

List<OutstandingProductSale> outstandingProductSales = [
  OutstandingProductSale(
    imageUrl: 'lib/src/assets/Home/sp1.png',
    name: 'Son LOreal',
    originalPrice: 15000,
    discountedPrice: 12000,
    sale: '20%',
  ),
  OutstandingProductSale(
    imageUrl: 'lib/src/assets/Home/sp2.png',
    name: 'Serum LOreal',
    originalPrice: 25000,
    discountedPrice: 20000,
    sale: '',
  ),
  OutstandingProductSale(
    imageUrl: 'lib/src/assets/Home/sp3.png',
    name: 'Mực LOreal',
    originalPrice: 30000,
    discountedPrice: 25000,
    sale: '15%',
  ),
];
