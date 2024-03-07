import 'package:dio/dio.dart';
import 'package:novindus_machine_test/application/models/branch_response.dart';
import 'package:novindus_machine_test/application/models/patient_list_response.dart';
import 'package:novindus_machine_test/application/models/treatment_response_model.dart';
import 'package:novindus_machine_test/utils/shared_preferences.dart';

class PatientListRepository {
  Dio client = Dio();
  SharedPrefs prefs = SharedPrefs();
  Future<List<Patient>> patientList() async {
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

  Future<List<GetBranch>> getBranch() async {
    List<GetBranch> getBranch = [];
    String token = await prefs.getToken('token');
    final response =
        await client.get('https://flutter-amr.noviindus.in/api/BranchList',
            options: Options(headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $token',
            }));
    print(response);
    (response.data as List).forEach((element) {
      getBranch.add(GetBranch.fromJson(element));
    });
    return getBranch;
  }

  Future<List<TreatmentName>> getTreatmentName() async {
    List<TreatmentName> getTreatmentName = [];
    String token = await prefs.getToken('token');
    final response =
        await client.get('https://flutter-amr.noviindus.in/api/TreatmentList',
            options: Options(headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $token',
            }));
    print(response);
    (response.data as List).forEach((element) {
      getTreatmentName.add(TreatmentName.fromJson(element));
    });
    return getTreatmentName;
  }
}
