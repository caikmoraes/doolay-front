import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: doolayMenu(scaffoldKey, context),
      body: const Center(
        child: Text('Login'),
      ),
    );
  }
}
