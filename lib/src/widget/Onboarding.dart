import 'package:beauty/src/widget/component/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/src/assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BeautyBox',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD61355),
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 46),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tỏa sáng\n',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD61355),
                      ),
                    ),
                    TextSpan(
                      text: 'Tự tin,\n',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Vẻ đẹp theo\n',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'cách của\n',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'bạn.',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 60),
                      DotProgressIndicator(),
                      SizedBox(height: 40),
                      CustomButton(
                        title: 'Đăng ký',
                        onPress: () => {context.go('/signup')},
                        buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Color(0xffD61355),
                              width: 1,
                            ),
                          ),
                        ),
                        textStyle:
                            TextStyle(color: Color(0xffD61355), fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        title: 'Đăng nhập',
                        onPress: () => {},
                        textStyle: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotProgressIndicator extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DotProgressIndicatorState createState() => _DotProgressIndicatorState();
}

class _DotProgressIndicatorState extends State<DotProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              height: index == 0 ? 10.0 : 8.0,
              width: index == 0 ? 20.0 : 10.0,
              decoration: BoxDecoration(
                color: index == 0 ? Colors.red : Colors.pinkAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          }),
        );
      },
    );
  }
}
