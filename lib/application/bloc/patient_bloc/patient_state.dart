part of 'patient_cubit.dart';

sealed class PatientListState extends Equatable {
  const PatientListState();

  @override
  List<Object> get props => [];
}

final class PatientListInitial extends PatientListState {}
final class PatientListLoading extends PatientListState {}
final class PatientListSuccess extends PatientListState {}
final class PatientListFailure extends PatientListState {}
