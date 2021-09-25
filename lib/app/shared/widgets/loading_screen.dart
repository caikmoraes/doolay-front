import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingScreen extends StatelessWidget {
  final String? message;
  const LoadingScreen({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: RiveAnimation.asset(AppConstants.DOOLAY_ANIMATION),
    );
  }
}
