import 'package:flutter/material.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: const Center(child: Text('Authenticate Here')),
    );
  }
}
