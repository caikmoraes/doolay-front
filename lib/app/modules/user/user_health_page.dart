import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/enum/health_state.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter/material.dart';

class UserHealthPage extends StatefulWidget {
  const UserHealthPage({Key? key}) : super(key: key);

  @override
  _UserHealthPageState createState() => _UserHealthPageState();
}

class _UserHealthPageState extends State<UserHealthPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  HealthState? health = HealthState.ok;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: PageBase(
        background: AppConstants.BACKGROUND_SAUDE,
        child: FormBase(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const ArrowBackHeader(),
                Center(
                  child: Text(
                    'Como está se sentindo hoje?',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 150,
                      child: RadioListTile<HealthState?>(
                        title: const Text('Bem'),
                        groupValue: health,
                        value: HealthState.ok,
                        onChanged: (value) => setState(() {
                          health = value;
                        }),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 200,
                      child: RadioListTile<HealthState?>(
                        title: const Text('Não muito bem'),
                        groupValue: health,
                        value: HealthState.nok,
                        onChanged: (value) => setState(() {
                          health = value;
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Se sim, o que você está sentindo?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      List<Symptoms> list = getSymptoms();
                      return SizedBox(
                        child: GridView.count(
                          crossAxisCount:
                              ResponsiveTool.isLargeScreen(context) ? 3 : 2,
                          childAspectRatio: 6,
                          children: list
                              .map(
                                (e) => DoolayCheckBox(
                                  text: e.description,
                                ),
                              )
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
                DoolayButton(
                  text: 'Confirmar',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Symptoms> getSymptoms() => [
        Symptoms('Falta de ar'),
        Symptoms('Tosse'),
        Symptoms('Coriza'),
        Symptoms('Dor de cabeça'),
        Symptoms('Cansaço'),
        Symptoms('Dores Musculares'),
        Symptoms('Espirros'),
        Symptoms('Dor no peito'),
        Symptoms('Febre'),
        Symptoms('Perda de olfato'),
        Symptoms('Diarreia'),
        Symptoms('Calafrios'),
        Symptoms('Perda de paladar'),
        Symptoms('Dor de garganta'),
      ];
}

class DoolayCheckBox extends StatefulWidget {
  final String text;
  const DoolayCheckBox({Key? key, required this.text}) : super(key: key);

  @override
  _DoolayCheckBoxState createState() => _DoolayCheckBoxState();
}

class _DoolayCheckBoxState extends State<DoolayCheckBox> {
  bool? selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: selected,
            onChanged: (value) => setState(() {
              selected = value;
            }),
          ),
          const SizedBox(width: 8),
          Text(widget.text),
        ],
      ),
    );
  }
}


