import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

extension AwesomeSnackBarContextExt on BuildContext {
  showErrorSb({String? message}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: message ?? 'Something went wrong',
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  showSuccessSb({required String message}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success!',
        message: message,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
