import 'package:flutter/material.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 16, right: 16),
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 218, 218, 218),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Mã giảm giá',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD61355), // Mã màu D61355
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 234, 234, 234),
                ),
                child: Text(
                  'HSD: 25/12/2024',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Divider(
              color: const Color.fromARGB(255, 196, 196, 196), thickness: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/src/assets/Vouchers/coupon.png',
                height: 60,
                width: 60,
              ),
              SizedBox(width: 20),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Giảm 10k tổng tiền món ăn',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Đơn hàng tối thiểu 200k.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD61355),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize:
                        Size(30, 30), // Chỉnh chiều rộng và chiều cao ở đây
                  ),
                  child: Text('Sử dụng'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
