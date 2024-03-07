import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patient_register_state.dart';

class PatientRegisterCubit extends Cubit<PatientRegisterState> {
  PatientRegisterCubit() : super(PatientRegisterInitial());
}
