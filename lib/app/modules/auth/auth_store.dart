import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends NotifierStore<Exception, int> {
  AuthStore() : super(0);

  Future<void> login(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const LoadingScreen(),
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Modular.to.navigate('/panel/');
  }
}
