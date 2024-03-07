import 'package:dio/dio.dart';
import 'package:novindus_machine_test/utils/shared_preferences.dart';
import 'package:novindus_machine_test/utils/utils.dart';

class AuthRepository {
  Dio client = Dio();
  SharedPrefs prefs = SharedPrefs();
  Future userLogin({
    required String? username,
    required String? password,
  }) async {
    FormData formData = FormData.fromMap({
      "username": "test_user",
      "password": "12345678",
    });
    print(username);
    print(password);

    final response = await client.post(
      'https://flutter-amr.noviindus.in/api/Login',
      data: formData,
    );
    print(response);
    if (response.data['status'] = true) {
      prefs.saveToken('token', response.data['token']);
      return true;
    } else {
      return false;
    }
  }
}
