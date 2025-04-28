// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training/data/dataresource/auth_local_datasource.dart';
import 'package:training/presentation/auth/blocs/login/login_bloc.dart';
import 'package:training/presentation/home/pages/main_page.dart';
// import 'package:training/core/extensions/build_context_ext.dart';
// import 'package:training/presentation/home/pages/main_page.dart';

import '../../../core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isShowPassword = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpaceHeight(100),
              Assets.images.logo.image(width: 400, height: 100),
              const SpaceHeight(80),
              CustomTextField(
                controller: emailController,
                label: 'Email Address',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.email.path,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const SpaceHeight(20),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscureText: isShowPassword,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.password.path,
                    height: 20,
                    width: 20,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black[200],
                  ),
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                ),
              ),

              const SpaceHeight(90),

              const SpaceHeight(20),

              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    AuthLocalDataSource().saveAuthData(state.authResponseModel);
                    context.pushReplacement(const MainPage());
                  }

                  if (state is LoginFailure) {
                    final errorMessage = jsonDecode(state.message)['message'];
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage),
                        backgroundColor: AppColors.red,
                      ),
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return CustomButtonTraining(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      },
                      title: 'Sign In',
                      backgroundColor: AppColors.blue[600],
                    );
                  },
                ),
              ),
              SpaceHeight(20),
              CustomButtonTraining(
                onPressed: () {},
                title: 'Attendance using Face ID',
                prefixIcon: Assets.icons.attendance.svg(),
              ),
              // CustomButton.filled(
              //   label: 'Login',
              //   onPressed: () {
              //     context.pushReplacement(const MainPage());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
