// lib/src/screens/faq/faq_screen.dart
import 'package:flutter/material.dart';
import 'widgets/FAQs_widget.dart';


class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
  ];

  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList = List.generate(faqList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HeaderTitle(title: 'Câu Hỏi Thường Gặp'),
            Divider(color: Color(0xFFD9D9D9), thickness: 2),
            Expanded(
              child: ListView.builder(
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  return FAQItem(
                    question: faqList[index]["question"] ?? "",
                    answer: faqList[index]["answer"] ?? "",
                    isExpanded: isExpandedList[index],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        isExpandedList[index] = expanded;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
