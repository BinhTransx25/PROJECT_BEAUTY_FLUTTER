import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              '404',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Page Not Found',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
