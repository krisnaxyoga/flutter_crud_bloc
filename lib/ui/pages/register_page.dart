import 'package:chatinganfe/bloc/auth/auth_bloc.dart';
import 'package:chatinganfe/model/register_model.dart';
import 'package:chatinganfe/shared/shared_method.dart';
import 'package:chatinganfe/shared/theme.dart';
import 'package:chatinganfe/ui/widget/button.dart';
import 'package:chatinganfe/ui/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            print(state.e);
            showCustomSnackbar(context, state.e);
          } else if (state is AuthSuccess) {
            showCustomSnackbar(context, 'Success register');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Register',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomsFormField(
                            title: 'Name',
                            controller: nameController,
                          ),
                          const SizedBox(height: 10),
                          CustomsFormField(
                            title: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 10),
                          CustomsFormField(
                            title: 'Phone',
                            controller: phoneController,
                          ),
                          const SizedBox(height: 10),
                          CustomsFormField(
                            title: 'Password',
                            obscureText: true,
                            controller: passwordController,
                          ),
                          const SizedBox(height: 10),
                          CustomsFormField(
                            title: 'Confirm Password',
                            obscureText: true,
                            controller: passwordConfirmController,
                          ),
                          const SizedBox(height: 20),
                          CustomsFilledButton(
                            title: 'Register',
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    AuthRegister(
                                      RegisterModel(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
