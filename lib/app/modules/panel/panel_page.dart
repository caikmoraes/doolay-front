import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/features/panel_features.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/widgets/doolay_feature.dart';
import 'package:doolay_front/app/shared/widgets/hello_widget.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:flutter/material.dart';

class PanelPage extends StatefulWidget {
  final Map<String, dynamic> userMap;
  final String title;
  const PanelPage({
    Key? key,
    this.title = 'PanelPage',
    required this.userMap,
  }) : super(key: key);
  @override
  PanelPageState createState() => PanelPageState();
}

class PanelPageState extends State<PanelPage> {
  final PanelStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final PanelStore store = Modular.get();
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: FutureBuilder(
        future: store.fetchUserDetails(
          widget.userMap['userId'],
          widget.userMap['profile'],
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const LoadingScreen();
            case ConnectionState.done:
              User? user = snapshot.data as User?;
              if (user != null) {
                return Scrollbar(
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
                );
              }
          }
          return const Center(
            child: Text('Uknown error'),
          );
        },
      ),
    );
  }
}
