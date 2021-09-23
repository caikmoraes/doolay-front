import 'package:flutter/material.dart';

class DoolayText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const DoolayText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
