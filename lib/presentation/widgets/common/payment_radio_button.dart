import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {

  const PaymentWidget({super.key});

  


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
        Row(
          children: [
            // RadioListTile(
            //   title: const Text('Cash'),
            //   value: 'Cash',
             
            //   onChanged: (value) {
                
            //   },
            // ),
            // RadioListTile(
            //   title: const Text('Card'),
            //   value: 'Card',
              
            // ),
          ],
        ),
      ],
    );
  }
}
