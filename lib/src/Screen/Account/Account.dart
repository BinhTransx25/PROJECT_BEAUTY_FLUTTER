import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'widgets/Account_widget.dart';
import '../../app/tabs/bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../bloc/login_bloc/login_event.dart';
import '../../api/setting_service.dart'; // Import SettingService

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late SettingService settingService;
  late Future<Map<String, dynamic>> settingFuture;

  @override
  void initState() {
    super.initState();
    settingService = SettingService();
    settingFuture = settingService.getSetting(); // Gọi API để lấy dữ liệu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Header(),
            Divider(color: Color(0xFFD9D9D9), thickness: 2),
            FutureBuilder<Map<String, dynamic>>(
              future: settingFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Lỗi: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("Không có dữ liệu"));
                } else {
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      OptionRow(
                        image: 'lib/src/assets/Account/user.png',
                        label: 'Thông tin cá nhân',
                        onTap: () {
                          context.push('/profile');
                        },
                      ),
                      DividerWithPadding(),
                      OptionRow(
                        image: 'lib/src/assets/Account/credit.png',
                        label: 'Phương thức thanh toán',
                        onTap: () {
                          context.go('/payment_methods', extra: 'account');
                        },
                      ),
                      DividerWithPadding(),
                      OptionRow(
                        image: 'lib/src/assets/Account/notification.png',
                        label: 'Thông báo',
                        onTap: () {
                          context.go('/notification_account');
                        },
                      ),
                      DividerWithPadding(),
                      OptionRow(
                        image: 'lib/src/assets/Account/question.png',
                        label: 'Câu hỏi thường gặp',
                        onTap: () {
                          context.go('/FAQs');
                        },
                      ),
                      DividerWithPadding(),
                      OptionRow(
                        image: 'lib/src/assets/Account/help.png',
                        label: 'Trung tâm trợ giúp',
                        onTap: () {
                          context.go('/help_center');
                        },
                      ),
                      DividerWithPadding(),
                      ...data.entries.map(
                        (entry) => ListTile(
                          leading: Icon(Icons.settings),
                          title: Text(entry.key),
                          subtitle: Text(entry.value.toString()),
                          onTap: () {
                            context.push('/setting_detail', extra: entry);
                          },
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'lib/src/assets/Account/logout.png',
                          color: Color(0xFFF81140),
                        ),
                        title: Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFF81140),
                          ),
                        ),
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('lib/src/assets/Account/logout.png', height: 40),
              SizedBox(height: 10),
              Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Bạn có chắc muốn đăng xuất?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(LogoutRequested());
                    Fluttertoast.showToast(
                      msg: "Bạn đã đăng xuất",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF81140),
                    elevation: 3,
                  ),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: const Color.fromARGB(255, 216, 216, 216)),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
