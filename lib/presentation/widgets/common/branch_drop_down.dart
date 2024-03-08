import 'package:flutter/material.dart';
import 'package:novindus_machine_test/application/bloc/patient_bloc/patient_cubit.dart';
import 'package:novindus_machine_test/application/bloc/patient_register_bloc/patient_register_cubit.dart';
import 'package:novindus_machine_test/application/models/branch_response.dart';

class BranchDropDown extends StatelessWidget {
  final PatientListCubit patientBloc;
  final PatientRegisterCubit registerBloc;
  const BranchDropDown({super.key, required this.patientBloc, required this.registerBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Branch',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0x3FD9D9D9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0.85,
                color: Colors.black.withOpacity(0.10000000149011612),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0.85,
                color: Colors.black.withOpacity(0.10000000149011612),
              ),
            ),
          ),
          items: patientBloc.branches.map((BranchResponse branch) {
            return DropdownMenuItem<String>(
              value: branch.name,
              child: Text(branch.name),
            );
          }).toList(),
          onChanged: (String? value) {
            registerBloc.onBranchSelect(value!);
          },
          hint: const Text('Select the branch'),
        )
      ],
    );
  }
}
