import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/features/panel_features.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:doolay_front/app/shared/widgets/doolay_feature.dart';
import 'package:doolay_front/app/shared/widgets/hello_widget.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/login_form.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PanelPage extends StatefulWidget {
  final String title;

  const PanelPage({
    Key? key,
    this.title = 'Painel',
  }) : super(key: key);

  @override
  PanelPageState createState() => PanelPageState();
}

class PanelPageState extends State<PanelPage> {
  final PanelStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    store.fetchUserDetails();
    super.initState();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScopedBuilder(
                store: store,
                onLoading: (context) => const LoadingScreen(),
                onError: (context, error) => DoolayErrorAlert(text: '$error'),
                onState: (context, UserModel state) => HelloWidget(
                  user: state,
                ),
              ),
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
