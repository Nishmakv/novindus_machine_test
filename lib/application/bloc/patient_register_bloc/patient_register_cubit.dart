import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:novindus_machine_test/application/models/treatment_response.dart';

part 'patient_register_state.dart';

class PatientRegisterCubit extends Cubit<PatientRegisterState> {
  PatientRegisterCubit() : super(PatientRegisterInitial());

  TextEditingController name = TextEditingController();
  String payment = "";
  List<int> selectedTreatmentIds = [];
  List<TreatmentResponse> selectedTreatments = [];
  String branchNam = "";
  String location = "";
  int numberOfMales = 0;
  int numberOfFemales = 0;
}
