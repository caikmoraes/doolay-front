import 'package:flutter/material.dart';

class DoolayTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  const DoolayTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _DoolayTextFieldState createState() => _DoolayTextFieldState();
}

class _DoolayTextFieldState extends State<DoolayTextField> {
  bool showing = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.label,
          ),
          controller: widget.controller,
          obscureText: showing,
        ),
        Visibility(
          visible: widget.isPassword,
          child: Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                mouseCursor: MouseCursor.defer,
                child: Icon(
                  showing ? Icons.visibility_off : Icons.visibility,
                  size: 32,
                ),
                onTap: () => setState(() {
                  showing = !showing;
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
