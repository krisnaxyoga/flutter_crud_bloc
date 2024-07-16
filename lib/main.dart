import 'package:chatinganfe/bloc/auth/auth_bloc.dart';
import 'package:chatinganfe/ui/pages/homepage.dart';
import 'package:chatinganfe/ui/pages/listuser_page.dart';
import 'package:chatinganfe/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Homepage(),
          '/register': (context) => const RegisterPage(),
          '/listuser': (context) => const ListuserPage(),
        },
      ),
    );
  }
}
