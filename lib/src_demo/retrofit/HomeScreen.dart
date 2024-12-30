import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api_client.dart'; // Đảm bảo bạn đã nhập đúng đường dẫn
import './modul/category.dart'; // Import model Category

class HomeScreenDemo extends StatefulWidget {
  const HomeScreenDemo({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenDemo> {
  late ApiClient apiClient;
  List<Category> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    apiClient = ApiClient(dio);
    fetchCategories(); // Gọi hàm fetchCategories
  }

  Future<void> fetchCategories() async {
    try {
      print("Fetching categories...");
      final response = await apiClient.getData();
      print("Categories fetched successfully!");
      setState(() {
        categories = response.data; // Cập nhật danh sách danh mục
        isLoading = false; // Đặt trạng thái là không tải nữa
      });
    } catch (e) {
      print('Error fetching categories: $e'); // In log khi có lỗi
      setState(() {
        isLoading = false; // Đặt trạng thái là không tải nữa
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  leading: Image.network(category.icon),
                  title: Text(category.name),
                );
              },
            ),
    );
  }
}
