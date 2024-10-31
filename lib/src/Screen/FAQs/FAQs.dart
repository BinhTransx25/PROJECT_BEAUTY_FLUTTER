import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  // Danh sách câu hỏi và câu trả lời
  final List<Map<String, String>> faqList = [
    {
      "question": "Làm thế nào để tôi mua hàng?",
      "answer":
          "Mua hàng online trở thành xu hướng được nhiều người quan tâm. Việc lên mạng và chọn cho mình món hàng ưng ý..."
    },
    {
      "question": "Chính sách hoàn trả sản phẩm như thế nào?",
      "answer":
          "Khách hàng có thể hoàn trả sản phẩm trong vòng 30 ngày kể từ khi nhận hàng nếu sản phẩm còn nguyên vẹn..."
    },
    {
      "question": "Tôi có thể theo dõi đơn hàng ở đâu?",
      "answer":
          "Bạn có thể theo dõi đơn hàng của mình trong mục 'Đơn hàng của tôi' trong ứng dụng hoặc website của chúng tôi..."
    },
    // Thêm nhiều câu hỏi và câu trả lời khác ở đây
  ];

  // Define expanded state list for each FAQ item
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    // Initialize expanded state for each FAQ item
    isExpandedList = List.generate(faqList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
         
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/src/assets/Account/ArrowLeft.png',
                    width: 30,
                    height: 30,
                  ),
                  // Khoảng cách giữa hình ảnh và tiêu đề
                  const Expanded(
                    child: Text(
                      'Câu Hỏi Thường Gặp',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Color(0xFFD9D9D9), thickness: 2),

            // Danh sách câu hỏi
            Expanded(
              child: ListView.builder(
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  return _buildFAQItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ExpansionTile(
          title: Text(
            faqList[index]["question"] ?? "",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            isExpandedList[index]
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              isExpandedList[index] = expanded;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
              child: Text(
                faqList[index]["answer"] ?? "",
                style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 149, 144, 144)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
