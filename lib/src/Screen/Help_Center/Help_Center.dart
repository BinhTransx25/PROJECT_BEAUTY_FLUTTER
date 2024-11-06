import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Spacer(),
                  Text(
                    'Trung tâm trợ giúp',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(
                color: Color(0xFFD9D9D9),
                thickness: 2,
              ),
            ),

            // Menu Options
            _buildMenuOption(
              context,
              icon: Icons.support_agent,
              text: 'Hỗ trợ khách hàng',
              routeName: '/customerSupport',
            ),
            _buildMenuOption(
              context,
              icon: Icons.language,
              text: 'Website',
              routeName: '/website',
            ),
            _buildMenuOption(
              context,
              icon: Icons.facebook,
              text: 'Facebook',
              routeName: '/facebook',
            ),
            _buildMenuOption(
              context,
              icon: Icons.facebook,
              text: 'Twitter',
              routeName: '/twitter',
            ),
            _buildMenuOption(
              context,
              icon: Icons.photo_camera,
              text: 'Instagram',
              routeName: '/instagram',
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each menu option
  Widget _buildMenuOption(BuildContext context,
      {required IconData icon, required String text, required String routeName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFDADADA)),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(icon, color: Colors.black),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
