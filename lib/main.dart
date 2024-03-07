import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novindus_machine_test/application/bloc/auth/cubit/login_cubit.dart';
import 'package:novindus_machine_test/presentation/pages/login_screen.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => LoginCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: LoginScreen(),
    );
  }
}
