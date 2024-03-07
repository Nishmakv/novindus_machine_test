part of 'patient_register_cubit.dart';

sealed class PatientRegisterState extends Equatable {
  const PatientRegisterState();

  @override
  List<Object> get props => [];
}

final class PatientRegisterInitial extends PatientRegisterState {}
