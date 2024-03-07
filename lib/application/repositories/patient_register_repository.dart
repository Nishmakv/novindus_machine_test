import 'package:dio/dio.dart';
import 'package:novindus_machine_test/application/models/patient_register_response.dart';
import 'package:novindus_machine_test/utils/shared_preferences.dart';

class PatientRegisterRepository {
  Dio client = Dio();
  SharedPrefs prefs = SharedPrefs();
  Future userLogin({
   required PatientRegisterRequest patientRegisterRequest,

  }) async {
    FormData formData = FormData.fromMap({
      "username": "test_user",
      "password": "12345678",
    });

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
