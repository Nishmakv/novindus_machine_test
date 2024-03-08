import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:novindus_machine_test/application/bloc/patient_bloc/patient_cubit.dart';
import 'package:novindus_machine_test/application/bloc/patient_register_bloc/patient_register_cubit.dart';
import 'package:novindus_machine_test/presentation/widgets/branch_drop_down.dart';
import 'package:novindus_machine_test/presentation/widgets/common/button.dart';
import 'package:novindus_machine_test/presentation/widgets/location_drop_down.dart';
import 'package:novindus_machine_test/presentation/widgets/common/text_form_field.dart';
import 'package:novindus_machine_test/presentation/widgets/treatment_date_widget.dart';
import 'package:novindus_machine_test/presentation/widgets/treatment_drop_down.dart';

class PatientRegisterScreen extends StatelessWidget {
  const PatientRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientRegisterCubit register =
        BlocProvider.of<PatientRegisterCubit>(context);
    PatientListCubit bloc = BlocProvider.of<PatientListCubit>(context)
      ..getAllBranches()
      ..getAllTreatments();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Ionicons.arrow_back_outline,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.notifications_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                      controller: register.nameController,
                      label: 'Name',
                      hint: 'ENter your full name',
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: register.numberController,
                      label: 'Whatsapp Number',
                      hint: 'Enter your Whatsapp number',
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: register.addressController,
                      label: 'Address',
                      hint: 'Enter your full address',
                    ),
                    const SizedBox(height: 20),
                    LocationDropDown(registerBloc: register, patientBloc: bloc),
                    const SizedBox(height: 20),
                    BranchDropDown(registerBloc: register, patientBloc: bloc),
                    const SizedBox(height: 20),
                    TreatmentDropDown(
                        registerBloc: register, patientBloc: bloc),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: register.totalAmountController,
                      label: 'Total Amount',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: register.discountAmountController,
                      label: 'Discount Amount',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    // PaymentWidget(registerBloc: register),
                    TextFieldWidget(
                      controller: register.advanceAmountController,
                      keyboardType: TextInputType.number,
                      label: 'Advance Amount',
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: register.balanceAmountController,
                      keyboardType: TextInputType.number,
                      label: 'Balance Amount',
                    ),
                    const SizedBox(height: 20),
                    DateWidget(registerBloc: register),
                    const SizedBox(height: 20),
                    ButtonWidget(onPressed: () {}, text: "Save")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
