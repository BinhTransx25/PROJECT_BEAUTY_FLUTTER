import 'package:flutter/material.dart';



class RadiantGlowSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 162,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Color(0xffD0D5DD),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            child: Center(
              child: Text(
                'Radiant Glow',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.asset(
                  'lib/src/assets/Home/frame.png',
                  width: 87,
                  height: 136,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                child: Image.asset(
                  'lib/src/assets/Home/frame1.png',
                  width: 87,
                  height: 136,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                child: Image.asset(
                  'lib/src/assets/Home/frame2.png',
                  width: 87,
                  height: 136,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                ),
                child: Image.asset(
                  'lib/src/assets/Home/frame3.png',
                  width: 87,
                  height: 136,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

