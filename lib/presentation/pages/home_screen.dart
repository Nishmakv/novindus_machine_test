import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:novindus_machine_test/application/bloc/patient_bloc/patient_cubit.dart';
import 'package:novindus_machine_test/presentation/widgets/common/loading_widget.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    PatientListCubit bloc = BlocProvider.of<PatientListCubit>(context)
      ..patientList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notification_add_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocConsumer<PatientListCubit, PatientListState>(
        listener: (context, state) {
          if (state is PatientListFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data loading failed'),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: LoadingWidget(
              loading: state is PatientListLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth / 1.5,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search_off_outlined),
                                hintText: 'Search for treatments',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: screenHeight / 13,
                            width: screenWidth / 4.5,
                            decoration: BoxDecoration(
                              color: const Color(0xFF006837),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sort by:'),
                          SizedBox(
                            height: 15,
                            width: 20,
                            child: Text('Date'),
                          )
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        flex: 1,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final patient = bloc.patient[index];
                            var orderNumber = index + 1;
                            return SizedBox(
                              child: Card(
                                color: const Color(0xFFF0F0F0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          orderNumber.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          patient.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      patient.patientdetailsSet[0].treatmentName
                                          .toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF006837),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.red,
                                          size: 10,
                                        ),
                                        Text(
                                          DateFormat('dd/MM/yyyy').format(
                                              patient.dateNdTime ??
                                                  DateTime.now()),
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        const Icon(
                                          Icons.person_2_outlined,
                                          color: Colors.red,
                                          size: 10,
                                        ),
                                        Text(
                                          patient.user.toString(),
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('View Booking Details'),
                                        Icon(Ionicons.chevron_forward_outline)
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
                          itemCount: bloc.patient.length,
                        ),
                      ),
                      const SizedBox(height: 20),
                       ElevatedButton(
                        onPressed: () {
                         
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006837),
                          minimumSize: const Size(330, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
