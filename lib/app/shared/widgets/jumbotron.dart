import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:flutter/material.dart';

class JumbotronWidget extends StatefulWidget {
  final double height;
  final double width;
  final String imagePath;
  final bool overlay;
  const JumbotronWidget({
    Key? key,
    required this.height,
    required this.imagePath,
    required this.width,
    this.overlay = false,
  }) : super(key: key);

  @override
  State<JumbotronWidget> createState() => _JumbotronWidgetState();
}

class _JumbotronWidgetState extends State<JumbotronWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Visibility(
        visible: widget.overlay,
        child: Container(
          color: Styles.PRIMARY_COLOR.withOpacity(.3),
          width: widget.width,
          height: widget.height,
        ),
      ),
    ]);
  }
}
