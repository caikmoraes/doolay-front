import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/features/panel_features.dart';
import 'package:doolay_front/app/shared/widgets/doolay_feature.dart';
import 'package:doolay_front/app/shared/widgets/hello_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:flutter/material.dart';

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
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const HelloWidget(),
              Wrap(
                alignment: WrapAlignment.center,
                children: getFeatures(context)
                    .map(
                      (e) => DoolayFeature(
                        icon: e.icon,
                        description: e.description,
                        route: e.route!,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
