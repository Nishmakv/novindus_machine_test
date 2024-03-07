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
  List<BranchResponse> branches = [];
  List<TreatmentResponse> treatments = [];
 

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

  Future getAllBranches() async {
    emit(PatientListLoading());
    final dataResponse = await patientListRepository.getBranch();
    if (dataResponse.isNotEmpty) {
      branches = dataResponse;
      emit(PatientListLoading());
    } else {
      emit(PatientListFailure());
    }
  }

  Future getAllTreatments() async {
    emit(PatientListLoading());
    final dataResponse = await patientListRepository.getTreatmentName();
    if (dataResponse.isNotEmpty) {
      treatments = dataResponse;
      emit(PatientListSuccess());
    } else {
      emit(PatientListFailure());
    }
  }
}
