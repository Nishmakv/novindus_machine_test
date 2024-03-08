import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:novindus_machine_test/application/bloc/patient_register_bloc/patient_register_cubit.dart';

class DateWidget extends StatelessWidget {
  final PatientRegisterCubit registerBloc;
  const DateWidget({super.key, required this.registerBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Treatment Date',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x3FD9D9D9),
            border: Border.all(
              color: Colors.black.withOpacity(0.10000000149011612),
              width: 0.85,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${registerBloc.selectedDate.toLocal()}'.split(' ')[0],
              ),
              IconButton(
                onPressed: () {
                  registerBloc.selectDate(context);
                },
                icon: const Icon(Ionicons.calendar_clear_outline),
                color: const Color(0xFF006837),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
