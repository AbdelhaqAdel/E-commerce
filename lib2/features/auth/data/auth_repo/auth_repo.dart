import '../models/login_model.dart';
import '../models/register_model.dart';
import '../../../../api/api_services.dart';
import '../../../../api/end_points.dart';

class AuthRepository {
  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        url: Endpoint.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response != null) {
        return LoginModel.fromJson(response.data);
      }
      return null;
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }

  Future<RegisterModel?> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await ApiService.post(
        url: Endpoint.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
        },
      );
      if (response != null) {
        return RegisterModel.fromJson(response.data);
      }
      return null;
    } catch (error) {
      throw Exception('Registration failed: $error');
    }
  }
}
