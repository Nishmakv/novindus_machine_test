import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novindus_machine_test/application/bloc/auth/login_cubit.dart';
import 'package:novindus_machine_test/presentation/pages/home_screen.dart';
import 'package:novindus_machine_test/presentation/widgets/common/button.dart';
import 'package:novindus_machine_test/presentation/widgets/common/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit authCubit = BlocProvider.of<LoginCubit>(context);
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Failed"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Frame 176.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        child: Image.asset('assets/images/Asset 1 2 (1).png',
                            width: 70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login Or Register To Book ',
                        style: TextStyle(
                          color: Color(0xFF404040),
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Your Appointments',
                        style: TextStyle(
                          color: Color(0xFF404040),
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                          controller: authCubit.usernameController,
                          label: 'Email',
                          hint: 'Enter your email'),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                          controller: authCubit.passwordController,
                          label: 'Password',
                          hint: 'Enter your password'),
                      const SizedBox(height: 40),
                      ButtonWidget(
                        onPressed: () {
                          authCubit.userLogin();
                        },
                        text: 'Login',
                      ),
                      const SizedBox(height: 130),
                      const Text(
                        'By creating or logging into an account you are agreeing with our',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
