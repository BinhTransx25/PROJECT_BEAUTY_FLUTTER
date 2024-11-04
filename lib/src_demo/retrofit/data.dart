class Promotion {
  final String imageUrl;
  final String name;

  Promotion({required this.imageUrl, required this.name});
}

List<Promotion> promotions = [
  Promotion(
    imageUrl: 'lib/src/assets/coupon.png',
    name: 'Mã giảm giá',
  ),
  Promotion(
    imageUrl: 'lib/src/assets/donation.png',
    name: 'Ưu đãi \n combo',
  ),
  Promotion(
    imageUrl: 'lib/src/assets/refund.png',
    name: 'Hoàn tiền',
  ),
  Promotion(
    imageUrl: 'lib/src/assets/freeshipping.png',
    name: 'Free ship',
  ),
];

class Category {
  final String name;
  Category({required this.name});
}

List<Category> categories = [
  Category(name: 'Son'),
  Category(name: 'Tẩy trang'),
  Category(name: 'Dưỡng ẩm'),
  Category(name: 'Mặt nạ bùn'),
  Category(name: 'Lột mụn'),
];

class Outstandingproduct {
  final String imageUrl;
  final String name;
  final double originalprice;
  final double discountedprice;

  Outstandingproduct(
      {required this.imageUrl,
      required this.name,
      required this.originalprice,
      required this.discountedprice});
}

List<Outstandingproduct> outstandingproduct = [
  Outstandingproduct(
    imageUrl: 'lib/src/assets/sp1.png',
    name: 'Son LOreal',
    originalprice: 15000,
    discountedprice: 12000,
  ),
  Outstandingproduct(
    imageUrl: 'lib/src/assets/sp2.png',
    name: 'Serum LOreal',
    originalprice: 25000,
    discountedprice: 20000,
  ),
  Outstandingproduct(
    imageUrl: 'lib/src/assets/sp3.png',
    name: 'Mực LOreal',
    originalprice: 30000,
    discountedprice: 25000,
  ),
  Outstandingproduct(
    imageUrl: 'lib/src/assets/sp4.png',
    name: 'Phấn LOreal',
    originalprice: 30000,
    discountedprice: 25000,
  ),
];

class Outstandingproductsale {
  final String imageUrl;
  final String name;
  final double originalprice;
  final double discountedprice;
  final String sale;

  Outstandingproductsale(
      {required this.imageUrl,
      required this.name,
      required this.originalprice,
      required this.discountedprice,
      required this.sale,
   });
}

List<Outstandingproductsale> outstandingproductsale = [
  Outstandingproductsale(
    imageUrl: 'lib/src/assets/sp1.png',
    name: 'Son LOreal',
    originalprice: 15000,
    discountedprice: 12000,
    sale: '20%',
  ),
  Outstandingproductsale(
    imageUrl: 'lib/src/assets/sp2.png',
    name: 'Serum LOreal',
    originalprice: 25000,
    discountedprice: 20000,
    sale: '', 
  ),
  Outstandingproductsale(
    imageUrl: 'lib/src/assets/sp3.png',
    name: 'Mực LOreal',
    originalprice: 30000,
    discountedprice: 25000,
    sale: '15%',
  ),
];
