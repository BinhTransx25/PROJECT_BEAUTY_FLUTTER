// lib/src/screens/faq/widgets.dart
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  const HeaderTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final Function(bool) onExpansionChanged;

  const FAQItem({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          onExpansionChanged: onExpansionChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
              child: Text(
                answer,
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
