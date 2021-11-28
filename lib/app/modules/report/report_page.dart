import 'package:doolay_front/app/modules/history/history_page.dart';
import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/doolay_date_picker.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:doolay_front/app/shared/widgets/doolay_select_field.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/report/report_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReportPage extends StatefulWidget {
  final String title;

  const ReportPage({Key? key, this.title = 'ReportPage'}) : super(key: key);

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  final ReportStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final TextEditingController dateInitCtr = TextEditingController();
  final TextEditingController dateFinCtr = TextEditingController();
  final MaskTextInputFormatter dateMask = MaskTextInputFormatter(
      mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});

  Report? currentReport;

  @override
  void initState() {
    store.getReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: doolayMenu(scaffoldKey, context),
      drawer: doolayDrawer(scaffoldKey, context),
      body: PageBase(
        background: AppConstants.BACKGROUND_USU,
        child: FormBase(
          child: Column(
            children: [
              const ArrowBackHeader(),
              const SizedBox(height: 8),
              const DoolayPageSubHeader(text: 'Relatórios'),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ScopedBuilder(
                  store: store,
                  onError: (context, error) => DoolayErrorAlert(text: '$error'),
                  onLoading: (context) => const LoadingScreen(),
                  onState: (context, List<Report> state) => Column(
                    children: [
                      DoolaySelectSetorField(
                        arrayValues: state,
                        onChange: (Report? value) => setState(() {
                          currentReport = value;
                        }),
                        label: 'Tipo do Relatório',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DoolayDatePicker(
                              label: 'Data Inicial',
                              controller: dateInitCtr,
                              mask: dateMask,
                              onPicked: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    String date =
                                        '${value.day}/${value.month}/${value.year}';
                                    return dateInitCtr.text = date;
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DoolayDatePicker(
                              label: 'Data Final',
                              controller: dateFinCtr,
                              mask: dateMask,
                              onPicked: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    String date =
                                        '${value.day}/${value.month}/${value.year}';
                                    dateFinCtr.text = date;
                                    return dateFinCtr.text;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DoolayButton(
                        text: 'Download',
                        onTap: () => currentReport?.onClick!(
                          Utils.toJsonDate(dateInitCtr.text),
                          Utils.toJsonDate(dateFinCtr.text),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Report {
  int? id;
  String? nome;
  DateTime? dateInit;
  DateTime? dateFinal;
  Function? onClick;
  bool enableDate;

  Report({
    this.id,
    this.nome,
    this.dateInit,
    this.dateFinal,
    this.onClick,
    this.enableDate = true,
  });

  @override
  String toString() => nome!;
}
