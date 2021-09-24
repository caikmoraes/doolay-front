import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_constants.dart';

AppBar doolayMenu(GlobalKey<ScaffoldState> scaffoldKey, BuildContext ctx) =>
    AppBar(
      elevation: 16,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(AppConstants.LOGO),
        ),
      ),
      title: ResponsiveTool.isLargeScreen(ctx)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'DOOLAY',
                  style: Theme.of(ctx).textTheme.headline3,
                ),
                Expanded(child: Container()),
                ...getDoolayPages().map(
                  (page) => page.name != 'Entrar'
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextButton(
                            onPressed: () => Modular.to.pushNamed(page.route),
                            child: Text(
                              page.name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                          child: Text(page.name),
                          onPressed: () => Modular.to.pushNamed(page.route),
                        ),
                ),
              ],
            )
          : Row(
              children: [
                Text(
                  'DOOLAY',
                  style: Theme.of(ctx).textTheme.headline3,
                ),
                Expanded(child: Container()),
                IconButton(
                  color: Colors.blue,
                  onPressed: () => scaffoldKey.currentState!.openDrawer(),
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
    );

List<DoolayPage> getDoolayPages() {
  return [
    DoolayPage('Home', '/'),
    DoolayPage('Covid-19', '/covid19/'),
    DoolayPage('Sobre nós', '/about/'),
    DoolayPage('Contato', '/contact/'),
    DoolayPage('Entrar', '/auth/'),
  ];
}

class DoolayPage {
  final String name;
  final String route;

  DoolayPage(this.name, this.route);
}
