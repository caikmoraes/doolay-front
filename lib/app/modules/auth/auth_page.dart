import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/widgets/jumbotron.dart';
import 'package:doolay_front/app/shared/widgets/login_form.dart';
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
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double imgWidth = width * .4;
    final double formWidth = width * .6;
    return Scaffold(
      appBar: doolayMenu(scaffoldKey, context),
      body: ResponsiveTool.isLargeScreen(context)
          ? Row(
              children: [
                JumbotronWidget(
                  height: height,
                  imagePath: AppConstants.LOGIN,
                  width: imgWidth,
                ),
                SizedBox(
                  width: formWidth,
                  child: Center(
                    child: Container(
                      width: formWidth / 2,
                      color: Colors.transparent,
                      child: DoolayLoginForm(),
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                JumbotronWidget(
                  overlay: true,
                  width: width,
                  height: height,
                  imagePath: AppConstants.LOGIN,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.5),
                        blurRadius: 10,
                        offset: const Offset(2, 2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Styles.OFF_WHITE,
                  ),
                  width: width * .9,
                  height: 350,
                  child: DoolayLoginForm(),
                ),
              ],
            ),
    );
  }
}
