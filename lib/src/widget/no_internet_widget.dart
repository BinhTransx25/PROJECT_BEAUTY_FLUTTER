import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('No Internet')),
      body: const Center(child: Text('Please check your internet connection.', style: TextStyle(fontSize: 20))),
    );
  }
}
