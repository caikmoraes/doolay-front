import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doolay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Styles.OFF_WHITE,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: Styles.PRIMARY_COLOR,
        colorScheme:
            ColorScheme.fromSwatch(accentColor: Styles.SECONDARY_COLOR),
      ),
    ).modular();
  }
}
