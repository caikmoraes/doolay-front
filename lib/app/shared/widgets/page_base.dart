import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final String background;
  final Widget child;
  const PageBase({
    Key? key,
    required this.child,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: Styles.OFF_WHITE,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            background,
            fit: BoxFit.fitWidth,
          ),
          Center(
            child: child,
          )
        ],
      ),
    );
  }
}
