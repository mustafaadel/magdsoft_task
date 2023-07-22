import 'package:dio/dio.dart';

import '../../../constants/end_points.dart';
import '../../data_providers/remote/dio_helper.dart';
import '../responses/login_response.dart';

class LoginRequest {
  static Future<LoginResponse> loginUser(
      String name, String phoneNumber) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'phone': phoneNumber,
      };

      final Response response =
          await DioHelper.postData(endPoint: EndPoint.login, data: data);
      return LoginResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
