import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:novindus_machine_test/application/bloc/patient_bloc/cubit/patient_cubit.dart';
import 'package:novindus_machine_test/application/models/patient_list_response.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Patient> patient = [];
    PatientListCubit patientListCubit =
        BlocProvider.of<PatientListCubit>(context)..patientList();
    return Scaffold(
      body: BlocConsumer<PatientListCubit, PatientListState>(
        listener: (context, state) {
          if (state is PatientListLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final patientCubit = patientListCubit.patient[index];
                        var orderNumber = index + 1;
                        return Container(
                          height: 100,
                          width: 50,
                          child: Card(
                            child: Row(
                              children: [
                                Text(orderNumber.toString()),
                                Column(
                                  children: [
                                    Text(
                                      patientCubit.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(patientCubit
                                        .patientdetailsSet[0].treatmentName
                                        .toString()),
                                    Row(
                                      children: [
                                        const Icon(
                                            Icons.calendar_month_outlined),
                                        Text(
                                          DateFormat('dd/MM/yyyy').format(
                                              patient[index].dateNdTime ??
                                                  DateTime.now()),
                                        ),
                                        const Icon(Icons.person_2_outlined),
                                        Text(patientCubit.user.toString()),
                                      ],
                                    ),
                                    Divider(),
                                    Text('View Booking Details'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: patient.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
