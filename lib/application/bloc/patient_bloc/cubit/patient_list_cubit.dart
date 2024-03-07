import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:novindus_machine_test/application/models/patient_list_response.dart';
import 'package:novindus_machine_test/application/repositories/patient_repository.dart';

part 'patient_list_state.dart';

class PatientListCubit extends Cubit<PatientListState> {
  PatientListCubit() : super(PatientListInitial());
  PatientListRepository patientListRepository = PatientListRepository();
  List<Patient> patient = [];
  Future patientList() async {
    emit(PatientListLoading());
    final dataResponse = await patientListRepository.patientList();
  }
}
