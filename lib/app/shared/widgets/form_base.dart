import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:flutter/material.dart';

class FormBase extends StatelessWidget {
  final Widget child;
  final double? height;
  const FormBase({
    Key? key,
    required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final ScrollController scrollController = ScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        width: ResponsiveTool.isLargeScreen(context) ? 700 : width * .9,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Styles.OFF_WHITE,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: Colors.black.withOpacity(.2),
              offset: const Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Styles.PRIMARY_COLOR,
          ),
        ),
        child: child,
      ),
    );
  }
}
