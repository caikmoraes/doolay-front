import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
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

  const HistoryDetailPage({Key? key, required this.historyID})
      : super(key: key);

  @override
  _HistoryDetailPageState createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  final SintomasStore sintomaStore = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScopedBuilder(
                      store: sintomaStore,
                      onError: (context, error) =>
                          DoolayErrorAlert(text: '$error'),
                      onLoading: (context) =>
                          const Center(child: LoadingScreen()),
                      onState: (context, state) => Wrap(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
