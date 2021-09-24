import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:flutter/material.dart';

import 'large_panel.dart';
import 'small_panel.dart';

class PanelPage extends StatefulWidget {
  final String title;
  const PanelPage({Key? key, this.title = 'PanelPage'}) : super(key: key);
  @override
  PanelPageState createState() => PanelPageState();
}

class PanelPageState extends State<PanelPage> {
  final PanelStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: ResponsiveTool.isLargeScreen(context)
          ? const LargePanel()
          : const SmallPanel(),
    );
  }
}
