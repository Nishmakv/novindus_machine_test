import 'package:dio/dio.dart';
import 'package:novindus_machine_test/application/models/branch_response.dart';
import 'package:novindus_machine_test/application/models/patient_list_response.dart';
import 'package:novindus_machine_test/application/models/patient_register_response.dart';
import 'package:novindus_machine_test/application/models/treatment_response.dart';
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
    for (var element in (response.data['patient'] as List)) {
      patient.add(Patient.fromJson(element));
    }
    return patient;
  }

  Future<List<BranchResponse>> getBranch() async {
    List<BranchResponse> getBranch = [];
    String token = await prefs.getToken('token');
    final response =
        await client.get('https://flutter-amr.noviindus.in/api/BranchList',
            options: Options(headers: {
              'content-type': 'application/json',
              'Authorization': 'Bearer $token',
            }));
    print(response);
    for (var element in (response.data['branches'] as List)) {
      getBranch.add(BranchResponse.fromJson(element));
    }
    return getBranch;
  }

  Future<List<TreatmentResponse>> getTreatmentName() async {
    List<TreatmentResponse> getTreatmentName = [];
    String token = await prefs.getToken('token');
    final response = await client.get(
      'https://flutter-amr.noviindus.in/api/TreatmentList',
      options: Options(headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );
    print(response);
    for (var element in (response.data['treatments'] as List)) {
      getTreatmentName.add(TreatmentResponse.fromJson(element));
    }
    return getTreatmentName;
  }

  Future<bool> registerPatient(
      {required PatientRegisterRequest request}) async {
    String token = await prefs.getToken('token');
    FormData formData = FormData.fromMap(request.toMap());
    final response = await client.post(
      'https://flutter-amr.noviindus.in/api/PatientUpdate',
      data: formData,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    if (response.data['status'] = true) {
      prefs.saveToken('token', response.data['token']);
      return true;
    } else {
      return false;
    }
  }
}
