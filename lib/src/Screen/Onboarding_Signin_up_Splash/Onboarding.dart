import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/src/assets/Onboarding_Signin_up_Splash/background.png'),
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
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tỏa sáng', style: _textStyle(Color(0xFFD61355))),
                        Text('Tự tin,', style: _textStyle(Colors.black)),
                        Text('Vẻ đẹp theo', style: _textStyle(Colors.black)),
                        Text('cách của', style: _textStyle(Colors.black)),
                        Text('bạn.', style: _textStyle(Colors.black)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Khám phá', style: _textStyle(Color(0xFFD61355))),
                        Text('Phong cách riêng',
                            style: _textStyle(Colors.black)),
                        Text('Mang lại', style: _textStyle(Colors.black)),
                        Text('sự tự tin', style: _textStyle(Colors.black)),
                        Text('và nổi bật.', style: _textStyle(Colors.black)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thời trang',
                            style: _textStyle(Color(0xFFD61355))),
                        Text('Là ngôn ngữ', style: _textStyle(Colors.black)),
                        Text('của vẻ đẹp', style: _textStyle(Colors.black)),
                        Text('và phong cách', style: _textStyle(Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 130),
                      DotProgressIndicator(
                          currentPage: _currentPage, totalPages: 3),
                      SizedBox(height: 40),
                      CustomButton(
                        title: 'Đăng ký',
                        onPress: () => context.go('/sign_up'),
                        buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side:
                                BorderSide(color: Color(0xffD61355), width: 1),
                          ),
                        ),
                        textStyle:
                            TextStyle(color: Color(0xffD61355), fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        title: 'Đăng nhập',
                        onPress: () => context.go('/signin_screen'),
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

  TextStyle _textStyle(Color color) {
    return TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}

class DotProgressIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  DotProgressIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalPages, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: currentPage == index ? 10.0 : 8.0,
          width: currentPage == index ? 20.0 : 10.0,
          decoration: BoxDecoration(
            color: currentPage == index ? Color(0xFFD61355) : Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      }),
    );
  }
}
