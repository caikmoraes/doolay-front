import 'package:doolay_front/app/shared/widgets/doolay_feature.dart';
import 'package:doolay_front/app/shared/widgets/hello_widget.dart';
import 'package:flutter/material.dart';

class LargePanel extends StatelessWidget {
  const LargePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: _height,
      child: Column(
        children: const [
          SizedBox(height: 32),
          HelloWidget(),
          SizedBox(height: 24),
          FeaturesList(),
        ],
      ),
    );
  }
}
