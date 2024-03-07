import 'package:dio/dio.dart';
import 'package:novindus_machine_test/application/models/patient_list_response.dart';
import 'package:novindus_machine_test/utils/shared_preferences.dart';

class PatientListRepository {
  Dio client = Dio();
  SharedPrefs prefs = SharedPrefs();
  Future<List<Patient>>patientList() async {
    List<Patient> patient = [];
    String token = await prefs.getToken('token');

    final response =
        await client.get('https://flutter-amr.noviindus.in/api/PatientList',
            options: Options(headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $token',
            }));
    print(response);
    (response.data as List).forEach((element) {
      patient.add(Patient.fromJson(element));
    });
    return patient;
  }
}
