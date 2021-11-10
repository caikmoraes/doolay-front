import 'package:doolay_front/app/modules/covid/covid_store.dart';
import 'package:doolay_front/app/modules/covid_cases/covid_cases_widget.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/widgets/covid_main_symptoms.dart';
import 'package:doolay_front/app/shared/widgets/covid_preventions.dart';
import 'package:doolay_front/app/shared/widgets/covid_whatis.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_header.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CovidPage extends StatefulWidget {
  final String title;

  const CovidPage({Key? key, this.title = 'CovidPage'}) : super(key: key);

  @override
  CovidPageState createState() => CovidPageState();
}

class CovidPageState extends State<CovidPage> {
  final CovidStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerWidth = width * .8 > 1024 ? 1024 : width * .8;

    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: containerWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const DoolayPageHeader(text: 'Covid-19'),
                  const SizedBox(height: 16),
                  if (ResponsiveTool.isSmallScreen(context)) ...[
                    const DoolayPageSubHeader(text: 'O que é?'),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: CovidWhatIs(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const DoolayPageSubHeader(text: 'Principais sintomas'),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: CovidMainSymptoms(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const DoolayPageSubHeader(text: 'Prevenção'),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: CovidPrevention(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const DoolayPageSubHeader(text: 'Casos no Brasil'),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Expanded(
                          child: CovidCasesWidget(height: 300),
                        ),
                      ],
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              DoolayPageSubHeader(text: 'O que é?'),
                              SizedBox(height: 16),
                              CovidWhatIs(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              DoolayPageSubHeader(text: 'Casos no Brasil'),
                              SizedBox(height: 16),
                              CovidCasesWidget(height: 165),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              DoolayPageSubHeader(text: 'Principais sintomas'),
                              SizedBox(height: 16),
                              CovidMainSymptoms(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              DoolayPageSubHeader(text: 'Prevenção'),
                              SizedBox(height: 16),
                              CovidPrevention(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
