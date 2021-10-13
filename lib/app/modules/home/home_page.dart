import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/widgets/feature.dart';
import 'package:doolay_front/app/shared/widgets/welcome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
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
              SizedBox(
                width: _width,
                height: _height / 2,
                child: const WelcomeWidget(),
              ),
              const SizedBox(height: 24),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: getFeatures()
                      .map((e) => FeatureWidget(text: e.text, icon: e.icon))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<HomeFeatures> getFeatures() => [
        HomeFeatures(
          Icons.description_outlined,
          'Relate todos os seus sintomas diariamente.',
        ),
        HomeFeatures(
          Icons.volunteer_activism_outlined,
          'Monitore sua saúde.',
        ),
        HomeFeatures(
          Icons.groups_outlined,
          'Ajude-nos a consolidar um ambiente mais seguro.',
        ),
        HomeFeatures(
          Icons.history_outlined,
          'Consulte o histórico dos seus dias.',
        ),
      ];
}

class HomeFeatures {
  final IconData icon;
  final String text;

  HomeFeatures(this.icon, this.text);
}
