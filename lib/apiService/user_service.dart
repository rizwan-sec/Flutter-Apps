import 'package:dio/dio.dart';
import 'package:userinfo/appSetting/base_url.dart';
import 'package:userinfo/model/user_model.dart';


class ApiService {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    try {
      final response = await _dio.get(BaseUrl.url);
      final List<dynamic> data = response.data['data'];
      return data.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}
