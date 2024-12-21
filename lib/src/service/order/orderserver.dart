import 'package:dio/dio.dart';
import '../../models/home/ordermodel.dart'; 

class OrderService {
  final Dio _dio = Dio();

  Future<List<Order>> fetchOrders() async {
    try {
      var response = await _dio.get('http://api-core.dsp.one/api/auth/order?page=1&limit=30');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((orderJson) => Order.fromJson(orderJson)).toList();
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      print('Error fetching orders: $e');
      throw e;
    }
  }
}