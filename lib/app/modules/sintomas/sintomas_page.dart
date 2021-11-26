import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:flutter/material.dart';

class SintomasPage extends StatefulWidget {
  final String title;
  const SintomasPage({Key? key, this.title = 'SintomasPage'}) : super(key: key);
  @override
  SintomasPageState createState() => SintomasPageState();
}
class SintomasPageState extends State<SintomasPage> {
  final SintomasStore store = Modular.get();

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