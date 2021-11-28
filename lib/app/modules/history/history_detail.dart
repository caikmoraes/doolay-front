import 'package:doolay_front/app/modules/health/health_store.dart';
import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/model/user_health_state.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HistoryDetailPage extends StatefulWidget {
  final String? historyID;
  final UserHealthState? healthState;

  const HistoryDetailPage(
      {Key? key, required this.historyID, required this.healthState})
      : super(key: key);

  @override
  _HistoryDetailPageState createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  final SintomasStore sintomaStore = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    if (widget.healthState?.estado != 'OK') {
      sintomaStore.findById(widget.healthState!.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      appBar: doolayMenu(scaffoldKey, context),
      drawer: doolayDrawer(scaffoldKey, context),
      body: PageBase(
        background: AppConstants.BACKGROUND_SAUDE,
        child: FormBase(
          child: SizedBox(
            height: height * .8,
            child: Column(
              children: [
                const ArrowBackHeader(),
                const SizedBox(height: 8),
                const DoolayPageSubHeader(text: 'Detalhes do registro:'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('Como você estava:'),
                        Text(widget.healthState!.estado == 'OK'
                            ? 'Bem'
                            : 'Não muito bem'),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Data de registro:'),
                        Text(
                            '${widget.healthState!.date!.day}/${widget.healthState!.date!.month}/${widget.healthState!.date!.year}'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (widget.healthState!.estado == 'OK') ...[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.health_and_safety,
                          size: 32,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Parabéns você está se cuidando bem. Nenhum sintoma apresentado.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  const DoolayPageSubHeader(text: 'Sintomas:',),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ScopedBuilder(
                        store: sintomaStore,
                        onError: (context, error) =>
                            DoolayErrorAlert(text: '$error'),
                        onLoading: (context) =>
                            const Center(child: LoadingScreen()),
                        onState: (context, state) {
                          SintomasList sintomasList = state as SintomasList;
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: sintomasList.sintomas.length,
                            itemBuilder: (context, index) => ListTile(
                              title: Text(sintomasList.sintomas[index].nome!),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
