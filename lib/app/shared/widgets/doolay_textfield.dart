import 'package:flutter/material.dart';

class DoolayTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  final Function? validator;
  const DoolayTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    required this.validator,
  }) : super(key: key);

  @override
  _DoolayTextFieldState createState() => _DoolayTextFieldState();
}

class _DoolayTextFieldState extends State<DoolayTextField> {
  bool showing = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.label,
            contentPadding: widget.isPassword
                ? const EdgeInsets.only(left: 16, right: 48)
                : null,
          ),
          controller: widget.controller,
          obscureText: widget.isPassword ? showing : !showing,
          validator: (value) => widget.validator!(value),
        ),
        Visibility(
          visible: widget.isPassword,
          child: Positioned(
            right: 0,
            top: 0,
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
