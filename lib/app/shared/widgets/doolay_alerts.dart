import 'package:flutter/material.dart';

class DoolayErrorAlert extends StatefulWidget {
  final String text;

  const DoolayErrorAlert({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<DoolayErrorAlert> createState() => _DoolayErrorAlertState();
}

class _DoolayErrorAlertState extends State<DoolayErrorAlert> {
  bool showing = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showing,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(widget.text),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 10,
                  child: InkWell(
                    child: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                    onTap: () => setState(() {
                      showing = !showing;
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoolaySuccessAlert extends StatefulWidget {
  final String text;

  const DoolaySuccessAlert({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<DoolayErrorAlert> createState() => _DoolayErrorAlertState();
}

class _DoolaySuccessAlertState extends State<DoolaySuccessAlert> {
  bool showing = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showing,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(widget.text),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 10,
                  child: InkWell(
                    child: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                    onTap: () => setState(() {
                      showing = !showing;
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
