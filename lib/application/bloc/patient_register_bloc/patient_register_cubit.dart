import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:novindus_machine_test/application/entity/treatment.dart';
import 'package:novindus_machine_test/application/models/patient_register_response.dart';
import 'package:novindus_machine_test/application/models/treatment_response.dart';
import 'package:novindus_machine_test/application/repositories/patient_repository.dart';

part 'patient_register_state.dart';

class PatientRegisterCubit extends Cubit<PatientRegisterState> {
  PatientRegisterCubit() : super(PatientRegisterInitial());
  PatientListRepository patientListRepository = PatientListRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String location = "";
  String branchName = "";
  String payment = "";
  String treatment = "";
  List<int> selectedTreatmentIds = [];
  List<Treatment> selectedTreatments = [];
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController advanceAmountController = TextEditingController();
  TextEditingController balanceAmountController = TextEditingController();
  int numberOfMales = 0;
  int numberOfFemales = 0;
  List<String> locations = ["Kochi", "Kozhikode", "Komarakom Kottayam"];

  Future patientRegister() async {
    emit(PatientRegisterLoading());
    final dataResponse = await patientListRepository.registerPatient(
        request: PatientRegisterRequest(
      name: nameController.text,
      executive: '',
      address: addressController.text,
      phone: numberController.text,
      location: location,
      branch: branchName,
      treatments: selectedTreatmentIds.join(","),
      totalAmount: int.parse(totalAmountController.text),
      discountAmount: int.parse(discountAmountController.text),
      payment: payment,
      advanceAmount: double.parse(advanceAmountController.text),
      balanceAmount: double.parse(balanceAmountController.text),
      male: selectedTreatmentIds.join(","),
      female: selectedTreatmentIds.join(","),
      dateNdTime: '',
    ));
    if (dataResponse) {
      emit(PatientRegisterSuccess());
    } else {
      emit(PatientRegisterFailure());
    }
  }

  void onBranchSelect(String value) {
    branchName = value;
    emit(PatientRegisterSuccess());
  }

  void onLocationSelect(String value) {
    location = value;
    emit(PatientRegisterSuccess());
  }

  void onTreatment(String value) {
    treatment = value;
    emit(PatientRegisterSuccess());
  }

  // create function on treatment save

  void onMaleCountChange(String action) {
    switch (action) {
      case "increment":
        numberOfMales++;
        emit(PatientRegisterSuccess(numberOfMales: numberOfMales));
        break;
      case "decrement":
        if (numberOfMales > 0) {
          numberOfMales--;
          emit(PatientRegisterSuccess(numberOfMales: numberOfMales));
        }
        break;
      default:
    }
  }

  void onFemaleCountChange(String action) {
    switch (action) {
      case "increment":
        numberOfFemales++;
        emit(PatientRegisterSuccess(numberOfFemales: numberOfFemales));
        break;
      case "decrement":
        if (numberOfFemales > 0) {
          numberOfFemales--;
          emit(PatientRegisterSuccess(numberOfFemales: numberOfFemales));
        }
    }
  }
}
