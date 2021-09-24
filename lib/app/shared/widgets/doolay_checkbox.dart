import 'package:flutter/material.dart';

class DoolayCheckBox extends StatefulWidget {
  final String? text;
  const DoolayCheckBox({Key? key, required this.text}) : super(key: key);

  @override
  _DoolayCheckBoxState createState() => _DoolayCheckBoxState();
}

class _DoolayCheckBoxState extends State<DoolayCheckBox> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: selected,
          onChanged: (bool? value) => setState(() {
            selected = value ?? false;
          }),
        ),
        const SizedBox(width: 16),
        Text(widget.text!),
      ],
    );
  }
}
