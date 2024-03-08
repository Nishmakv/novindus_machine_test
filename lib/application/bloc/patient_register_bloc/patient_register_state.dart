part of 'patient_register_cubit.dart';

abstract class PatientRegisterState extends Equatable {
  const PatientRegisterState();

  @override
  List<Object?> get props => [];
}

class PatientRegisterInitial extends PatientRegisterState {}

class PatientRegisterLoading extends PatientRegisterState {}

class PatientRegisterSuccess extends PatientRegisterState {}

class PatientRegisterPeopleCount extends PatientRegisterState {
  final int? numberOfMales; // Make numberOfMales optional by using int?
  final int? numberOfFemales;

  const PatientRegisterPeopleCount({this.numberOfMales, this.numberOfFemales});

  @override
  List<Object?> get props => [numberOfMales];
}

class PatientRegisterFailure extends PatientRegisterState {}
