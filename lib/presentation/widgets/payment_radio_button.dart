import 'package:flutter/material.dart';
import 'package:novindus_machine_test/application/bloc/patient_register_bloc/patient_register_cubit.dart';

class PaymentWidget extends StatelessWidget {
  final PatientRegisterCubit registerBloc;
  const PaymentWidget({super.key, required this.registerBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Payment Option',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        ListView(
          scrollDirection: Axis.horizontal,
          children:[Expanded(
            flex: 1,
            child: RadioListTile(
              title: const Text('Cash'),
              value: 'Cash',
              groupValue: registerBloc.payment,
              onChanged: (value) {
                registerBloc.onPaymentOption(value as String);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: RadioListTile(
              title: const Text('Card'),
              value: 'Card',
              groupValue: registerBloc.payment,
              onChanged: (value) {
                registerBloc.onPaymentOption(value as String);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: RadioListTile(
              title: const Text('UPI'),
              value: 'UPI',
              groupValue: registerBloc.payment,
              onChanged: (value) {
                registerBloc.onPaymentOption(value as String);
              },
            ),
          ),
          ],
        ),
      ],
    );
  }
}
