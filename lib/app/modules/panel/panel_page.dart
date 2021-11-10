import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/features/panel_features.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/widgets/doolay_feature.dart';
import 'package:doolay_front/app/shared/widgets/hello_widget.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PanelPage extends StatefulWidget {
  final Map<String, dynamic> userMap;
  final String title;
  const PanelPage({
    Key? key,
    this.title = 'Painel',
    required this.userMap,
  }) : super(key: key);
  @override
  PanelPageState createState() => PanelPageState();
}

class PanelPageState extends State<PanelPage> {
  final PanelStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  initState() {
    store.fetchUserDetails(
      widget.userMap['userId'],
      widget.userMap['profile'],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: ScopedBuilder(
        store: store,
        onLoading: (context) => const LoadingScreen(),
        onError: (context, error) => const Center(
          child: Text('Ops! Algo deu errado'),
        ),
        onState: (context, User user) => Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HelloWidget(
                  user: user,
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
      ),
    );
  }
}
