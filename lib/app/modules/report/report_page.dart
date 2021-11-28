import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:doolay_front/app/shared/widgets/doolay_select_field.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/report/report_store.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  final String title;

  const ReportPage({Key? key, this.title = 'ReportPage'}) : super(key: key);

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  final ReportStore store = Modular.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  Report? currentReport;

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
                child: Column(
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Report> getReports() => [
        Report(
          nome: 'Registros Diários',
          onClick: () => debugPrint('Registros diários'),
        ),
        Report(
          nome: 'Registros Diários (Gráfico)',
          onClick: () => debugPrint('Registros diários (Gráfico'),
        ),
      ];
}

class Report {
  String? nome;
  DateTime? dateInit;
  DateTime? dateFinal;
  Function? onClick;

  Report({
    required this.nome,
    this.dateInit,
    this.dateFinal,
    required this.onClick,
  });

  @override
  String toString() => nome!;
}
