import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novindus_machine_test/application/bloc/auth/login_cubit.dart';
import 'package:novindus_machine_test/application/bloc/patient_bloc/patient_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novindus_machine_test/application/bloc/patient_register_bloc/patient_register_cubit.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:novindus_machine_test/presentation/pages/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/pages/login_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => PatientListCubit(),
      ),
      BlocProvider(
        create: (context) => PatientRegisterCubit(),
      )
    ],
    child:  MyApp(),
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FutureBuilder(
        future: _checkToken(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); 
          } else {
            if (snapshot.hasData && snapshot.data == true) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          }
        },
      ),
    );
  }

  Future<bool> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }
}
