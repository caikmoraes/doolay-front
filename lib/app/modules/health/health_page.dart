import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/enum/health_state.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/doolay_checkbox.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/login_form.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/health/health_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HealthPage extends StatefulWidget {
  final String title;

  const HealthPage({Key? key, this.title = 'HealthPage'}) : super(key: key);

  @override
  HealthPageState createState() => HealthPageState();
}

class HealthPageState extends State<HealthPage> {
  final HealthStore store = Modular.get();
  final SintomasStore sintomaStore = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  HealthState? healthState = HealthState.ok;
  List<Symptoms> mySymptoms = [];

  @override
  void initState() {
    sintomaStore.fetchSintomas();
    super.initState();
  }

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
                        groupValue: healthState,
                        value: HealthState.ok,
                        onChanged: (value) => setState(() {
                          healthState = value;
                        }),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 200,
                      child: RadioListTile<HealthState?>(
                        title: const Text('Não muito bem'),
                        groupValue: healthState,
                        value: HealthState.nok,
                        onChanged: (value) => setState(() {
                          healthState = value;
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Se não estiver se sentindo bem, o que você está sentindo?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 8),
                ScopedBuilder (
                  store: sintomaStore,
                  onError: (context, error) => DoolayErrorAlert(text: '$error'),
                  onLoading: (context) => const Center(child: LoadingScreen()),
                  onState: (context, state) {
                    if (state is SintomasList) {
                      return Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SizedBox(
                              child: GridView.count(
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount:
                                    ResponsiveTool.isLargeScreen(context)
                                        ? 3
                                        : 2,
                                childAspectRatio: 6,
                                children: state.sintomas
                                    .map(
                                      (e) => DoolayCheckBox(
                                        text: e.nome!,
                                        action: (bool? value) => setState(
                                          () {
                                            bool isAdding = value ?? false;
                                            if (isAdding) {
                                              mySymptoms.add(e);
                                            } else {
                                              mySymptoms.remove(e);
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                const SizedBox(height: 8),
                ScopedBuilder(
                  store: store,
                  onError: (context, error) => DoolayErrorAlert(text: '$error'),
                  onLoading: (context) => const LoadingScreen(),
                  onState: (context, state) {
                    if(state == 1){
                      return const DoolaySuccessAlert(text: 'Registro realizado com sucesso');
                    }
                    return Container();
                  },
                ),
                const SizedBox(height: 8),
                DoolayButton(
                  text: 'Confirmar',
                  onTap: () => store.saveHealthState(healthState!, mySymptoms),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
