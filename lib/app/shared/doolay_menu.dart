import 'package:doolay_front/app/modules/auth/auth_store.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_constants.dart';
import 'layout/style.dart';
import 'widgets/doolay_button.dart';

AppBar doolayMenu(GlobalKey<ScaffoldState> scaffoldKey, BuildContext ctx) {
  AuthStore authStore = Modular.get();
  return AppBar(
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
                      : DoolayButton(
                          text: authStore.getToken().isEmpty? page.name : 'Sair',
                          onTap: authStore.getToken().isEmpty? () => Modular.to.pushNamed(page.route) : () {
                            Modular.dispose();
                            Modular.to.pushReplacementNamed('/auth/');
                          },
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
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
    );
}

Drawer doolayDrawer(GlobalKey<ScaffoldState> key, BuildContext ctx) {
  AuthStore authStore = Modular.get();
  return Drawer(
      child: Column(
        children: [
          ...getDoolayPages().map(
            (page) => page.name != 'Entrar'
                ? ListTile(
                    title: Text(page.name),
                    onTap: () => Modular.to.pushNamed(page.route),
                    hoverColor: Styles.SECONDARY_COLOR.withOpacity(.4),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(authStore.getToken().isEmpty? page.name : 'Sair'),
                            onPressed: authStore.getToken().isEmpty? () => Modular.to.pushNamed(page.route): () {
                              Modular.dispose();
                              Modular.to.pushReplacementNamed('/auth/');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
}

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
