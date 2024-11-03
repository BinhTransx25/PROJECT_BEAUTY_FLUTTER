import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: ClipOval(
          child: Image.asset(
            'lib/src/assets/Account/logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
