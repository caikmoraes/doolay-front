import 'package:flutter/material.dart';

class DoolaySelectField extends StatefulWidget {
  final List<String> arrayValues;
  final Function onChange;
  final String label;
  const DoolaySelectField({
    Key? key,
    required this.arrayValues,
    required this.onChange,
    required this.label,
  }) : super(key: key);

  @override
  _DoolaySelectFieldState createState() => _DoolaySelectFieldState();
}

class _DoolaySelectFieldState extends State<DoolaySelectField> {
  String? value;
  @override
  Widget build(BuildContext context) {
    List<String> list = widget.arrayValues;
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
      ),
      value: value,
      items: list
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (String? newValue) {
        setState(() {
          value = newValue;
        });
        widget.onChange(newValue);
      },
    );
  }
}
