import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/model/user_health_state.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/history/history_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HistoryPage extends StatefulWidget {
  final String title;

  const HistoryPage({Key? key, this.title = 'HistoryPage'}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  final HistoryStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    store.fetchHealthHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: PageBase(
        background: AppConstants.BACKGROUND_USU,
        child: FormBase(
          child: SizedBox(
            height: height * .8,
            child: Column(
              children: [
                const ArrowBackHeader(),
                const DoolayPageSubHeader(text: 'Histórico de Registros'),
                const SizedBox(height: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ScopedBuilder(
                      store: store,
                      onError: (context, error) =>
                          DoolayErrorAlert(text: '$error'),
                      onLoading: (context) => const LoadingScreen(),
                      onState: (context, List<UserHealthState> state) {
                        if (state.isNotEmpty) {
                          return ListView.builder(
                            itemCount: state.length,
                            itemBuilder: (context, index) => Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                hoverColor: Styles.PRIMARY_COLOR.withOpacity(.5),
                                title: Row(
                                  children: [
                                    Text(Utils.formatDate(state[index].date)),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      height: 24,
                                      width: 2,
                                      color: state[index].estado == 'OK'? Styles.PRIMARY_COLOR : Colors.yellow,
                                    ),
                                    Text(state[index].estado == 'OK'? 'Sentindo-se bem' : 'Sentindo-se não muito bem'),
                                  ],
                                ),
                                onTap: () => Modular.to.pushNamed('./details?id=${state[index].id}', arguments: state[index]),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.warning,
                                  size: 32,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Você ainda não registrou seu estado de saúde na plataforma.',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Utils {
  static String formatDate(DateTime? date) => date != null? '${date.day}/${date.month}/${date.year}' : '';
}
