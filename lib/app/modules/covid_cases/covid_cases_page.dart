import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/covid_cases/covid_cases_store.dart';
import 'package:flutter/material.dart';

class CovidCasesWidget extends StatefulWidget {
  final String title;
  const CovidCasesWidget({Key? key, this.title = 'CovidCasesPage'}) : super(key: key);
  @override
  CovidCasesWidgetState createState() => CovidCasesWidgetState();
}
class CovidCasesWidgetState extends State<CovidCasesWidget> {
  final CovidCasesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}