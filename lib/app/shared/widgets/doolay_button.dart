import 'package:flutter/material.dart';

class DoolayButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const DoolayButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
      child: Text(text),
      onPressed: () => onTap(),
    );
  }
}
