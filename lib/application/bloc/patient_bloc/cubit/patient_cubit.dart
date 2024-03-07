import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:novindus_machine_test/application/models/branch_response.dart';
import 'package:novindus_machine_test/application/models/patient_list_response.dart';
import 'package:novindus_machine_test/application/models/treatment_response.dart';
import 'package:novindus_machine_test/application/repositories/patient_repository.dart';

part 'patient_state.dart';

class PatientListCubit extends Cubit<PatientListState> {
  PatientListCubit() : super(PatientListInitial());
  PatientListRepository patientListRepository = PatientListRepository();
  List<Patient> patient = [];
  List<GetBranch> getBranch = [];
  List<TreatmentResponse> getTreatmentName = [];
  List<int> selectedTreatmentIds = [];
  List<TreatmentResponse> selectedTreatments = [];

  Future patientList() async {
    emit(PatientListLoading());
    final dataResponse = await patientListRepository.patientList();
    if (dataResponse.isNotEmpty) {
      patient = dataResponse;
      emit(PatientListSuccess());
    } else {
      emit(PatientListFailure());
    }
  }

  Future allBranch() async {
    emit(PatientListLoading());
    final dataResponse = await patientListRepository.getBranch();
    if (dataResponse.isNotEmpty) {
      getBranch = dataResponse;
      emit(PatientListLoading());
    } else {
      emit(PatientListFailure());
    }
  }

  Future treatmentName() async {
    emit(PatientListLoading());
    final dataResponse = await patientListRepository.getTreatmentName();
    if (dataResponse.isNotEmpty) {
      getTreatmentName = dataResponse;
      emit(PatientListSuccess());
    } else {
      emit(PatientListFailure());
    }
  }
}
