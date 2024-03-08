import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:novindus_machine_test/application/entity/treatment.dart';
import 'package:novindus_machine_test/application/models/patient_register_response.dart';
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
  int numberOfMales = 1;
  int numberOfFemales = 1;
  List<String> locations = ["Kochi", "Kozhikode", "Kumarakom Kottayam"];
  DateTime selectedDate = DateTime.now();

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
      dateNdTime: selectedDate.toString(),
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
    selectedTreatmentIds.add(int.parse(value));
    emit(PatientRegisterSuccess());
  }

  // create function on treatment save

  void onTreatmentSave(String name, int males, int females) {
    selectedTreatments.add(Treatment(
        name: treatment, female: numberOfFemales, males: numberOfMales));

    numberOfMales = 1;
    numberOfFemales = 1;
    name = '';
    emit(PatientRegisterSuccess());
  }

  void onMaleCountChange(String action) {
    switch (action) {
      case "increment":
        numberOfMales++;
        emit(PatientRegisterPeopleCount(numberOfMales: numberOfMales));
        break;
      case "decrement":
        if (numberOfMales > 0) {
          numberOfMales--;
          emit(PatientRegisterPeopleCount(numberOfMales: numberOfMales));
        }
        break;
    }
  }

  void onFemaleCountChange(String action) {
    switch (action) {
      case "increment":
        numberOfFemales++;
        emit(PatientRegisterPeopleCount(numberOfFemales: numberOfFemales));
        break;
      case "decrement":
        if (numberOfFemales > 0) {
          numberOfFemales--;
          emit(PatientRegisterPeopleCount(numberOfFemales: numberOfFemales));
        }
    }
  }

  void onPaymentOption(String value) {
    payment = value;
    emit(PatientRegisterSuccess());
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      emit(PatientRegisterSuccess());
    }
  }
}
