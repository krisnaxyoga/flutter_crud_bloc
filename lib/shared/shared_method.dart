import 'package:another_flushbar/flushbar.dart';
import 'package:chatinganfe/shared/theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String Message) {
  Flushbar(
    message: Message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}
