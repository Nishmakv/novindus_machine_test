import 'package:dio/dio.dart';
import 'package:novindus_machine_test/utils/shared_preferences.dart';

class AuthRepository {
  Dio client = Dio();
  SharedPrefs prefs = SharedPrefs();
  Future userLogin({
    required String? username,
    required String? password,
  }) async {
    FormData formData = FormData.fromMap({
      "username": username!.trim(),
      "password": password!.trim(),
    });

    final response = await client.post(
      'https://flutter-amr.noviindus.in/api/Login',
      data: formData,
    );

    if (response.data['status'] = true) {
      prefs.saveToken('token', response.data['token']);
      return true;
    } else {
      return false;
    }
  }
}
