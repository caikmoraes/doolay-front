import 'package:flutter/material.dart';

class DoolayPageSubHeader extends StatelessWidget {
  final String text;

  const DoolayPageSubHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
