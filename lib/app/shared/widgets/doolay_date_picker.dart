import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DoolayDatePicker extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function onPicked;
  final MaskTextInputFormatter mask;
  final bool? enabled;

  const DoolayDatePicker({
    Key? key,
    required this.label,
    required this.controller,
    required this.onPicked,
    required this.mask,
    this.enabled = true,
  }) : super(key: key);

  @override
  _DoolayDatePickerState createState() => _DoolayDatePickerState();
}

class _DoolayDatePickerState extends State<DoolayDatePicker> {
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
          inputFormatters: [widget.mask],
          enabled: widget.enabled,
        ),
        Visibility(
          child: Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Icon(
                  Icons.date_range,
                  size: 32,
                ),
                onTap: () => widget.onPicked(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
