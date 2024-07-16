import 'package:chatinganfe/shared/theme.dart';
import 'package:flutter/material.dart';

class Registersuccesspage extends StatelessWidget {
  const Registersuccesspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Register Success',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ),
      ),
    );
  }
}
