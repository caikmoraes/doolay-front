import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:flutter/material.dart';

class JumbotronWidget extends StatefulWidget {
  final double height;
  const JumbotronWidget({Key? key, required this.height}) : super(key: key);

  @override
  State<JumbotronWidget> createState() => _JumbotronWidgetState();
}

class _JumbotronWidgetState extends State<JumbotronWidget> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: widget.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.HOME),
          colorFilter: ColorFilter.mode(
            Styles.SECONDARY_COLOR.withOpacity(.5),
            BlendMode.softLight,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
