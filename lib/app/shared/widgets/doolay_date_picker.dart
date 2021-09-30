import 'package:flutter/material.dart';

class DoolayDatePicker extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function onPicked;
  const DoolayDatePicker({
    Key? key,
    required this.label,
    required this.controller,
    required this.onPicked,
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
