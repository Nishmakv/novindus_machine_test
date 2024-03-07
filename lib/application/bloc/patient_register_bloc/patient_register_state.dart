part of 'patient_register_cubit.dart';

sealed class PatientRegisterState extends Equatable {
  const PatientRegisterState();

  @override
  List<Object> get props => [];
}

final class PatientRegisterInitial extends PatientRegisterState {}
final class PatientRegisterLoading extends PatientRegisterState {}
final class PatientRegisterSuccess extends PatientRegisterState {}
final class PatientRegisterFailure extends PatientRegisterState {}
