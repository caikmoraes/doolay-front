import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/widgets/jumbotron.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        JumbotronWidget(
          width: _width,
          height: ResponsiveTool.isLargeScreen(context)
              ? _height
              : _height / 2 - 50,
          imagePath: AppConstants.HOME,
        ),
        ResponsiveTool.isLargeScreen(context)
            ? PositionedHomeWidget(
                top: 90,
                right: 20,
                width: _width * .3,
              )
            : PositionedHomeWidget(
                bottom: 0,
                width: _width * 0.6,
              ),
      ],
    );
  }
}

class PositionedHomeWidget extends StatelessWidget {
  final double? bottom;
  final double? right;
  final double? left;
  final double? top;
  final double? width;
  final double? height;
  const PositionedHomeWidget(
      {Key? key,
      this.bottom,
      this.right,
      this.left,
      this.top,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      top: top,
      right: right,
      left: left,
      child: Container(
        height: height ?? 200,
        width: width,
        decoration: BoxDecoration(
          color: Styles.SECONDARY_COLOR,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
          boxShadow: const [
            BoxShadow(
              color: Styles.PRIMARY_COLOR,
              offset: Offset(-8, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              'BEM-VINDO!',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            SelectableText(
              'Como está se sentindo hoje?',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
