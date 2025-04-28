// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training/data/dataresource/auth_local_datasource.dart';
import 'package:training/data/dataresource/auth_remote_datasource.dart';
import 'package:training/presentation/auth/blocs/login/login_bloc.dart';
import 'package:training/presentation/home/blocs/logout/logout_bloc.dart';
import 'package:training/presentation/home/pages/main_page.dart';
import 'presentation/auth/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              LogoutBloc(authRemoteDatasource: AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        ),
        home: FutureBuilder(
            future: AuthLocalDataSource().isAuthData(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return MainPage();
              }
              return SplashPage();
            }),
      ),
    );
  }
}
