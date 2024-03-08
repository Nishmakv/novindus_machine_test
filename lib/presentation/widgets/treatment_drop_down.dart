import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:novindus_machine_test/application/bloc/patient_bloc/patient_cubit.dart';
import 'package:novindus_machine_test/application/bloc/patient_register_bloc/patient_register_cubit.dart';
import 'package:novindus_machine_test/application/models/treatment_response.dart';
import 'package:novindus_machine_test/presentation/widgets/common/button.dart';

class TreatmentDropDown extends StatelessWidget {
  final PatientListCubit patientBloc;
  final PatientRegisterCubit registerBloc;
  const TreatmentDropDown(
      {super.key, required this.registerBloc, required this.patientBloc});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientRegisterCubit, PatientRegisterState>(
      bloc: registerBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0x3FD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '1.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Couple combo package i..',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Ionicons.close_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Male',
                        style: TextStyle(
                          color: Color(0xFF006837),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Colors.black.withOpacity(0.20000000298023224),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Female',
                        style: TextStyle(
                          color: Color(0xFF006837),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Colors.black.withOpacity(0.20000000298023224),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const Icon(Ionicons.pencil_outline)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                modelBottomSheet(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006837),
                minimumSize: const Size(330, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Row(
                children: [
                  Text('+'),
                  SizedBox(width: 5),
                  Text(
                    'Add Treatments',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void modelBottomSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        enableDrag: true,
        builder: (context) {
          return BlocBuilder<PatientRegisterCubit, PatientRegisterState>(
              builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose Treatment',
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
                            color:
                                Colors.black.withOpacity(0.10000000149011612),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0.85,
                            color:
                                Colors.black.withOpacity(0.10000000149011612),
                          ),
                        ),
                      ),
                      items: patientBloc.treatments
                          .map((TreatmentResponse treatment) {
                        return DropdownMenuItem<String>(
                          value: treatment.id.toString(),
                          child: Text(treatment.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        registerBloc.onTreatment(value!);
                      },
                      hint: const Text('Choose your treatment'),
                    ),
                    const SizedBox(height: 30),
                    const Text('Add Patients'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x3FD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.85,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Male',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        GestureDetector(
                          onTap: () {
                            registerBloc.onMaleCountChange("decrement");
                          },
                          child: const CircleAvatar(
                            radius: 23,
                            backgroundColor: Color(0xFF006837),
                            child: Icon(Ionicons.remove_outline),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.85,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ),
                          child: Center(
                              child:
                                  Text(registerBloc.numberOfMales.toString())),
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          onTap: () {
                            registerBloc.onMaleCountChange("increment");
                          },
                          child: const CircleAvatar(
                            radius: 23,
                            backgroundColor: Color(0xFF006837),
                            child: Icon(Ionicons.add_outline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x3FD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.85,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Female',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        GestureDetector(
                          onTap: () {
                            registerBloc.onFemaleCountChange("decrement");
                          },
                          child: const CircleAvatar(
                            radius: 23,
                            backgroundColor: Color(0xFF006837),
                            child: Icon(Ionicons.remove_outline),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.85,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ),
                          child: Center(
                              child: Text(
                                  registerBloc.numberOfFemales.toString())),
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          onTap: () {
                            registerBloc.onFemaleCountChange("increment");
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFF006837),
                            child: Icon(Ionicons.add_outline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Save',
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
