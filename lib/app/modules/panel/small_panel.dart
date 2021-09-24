import 'package:doolay_front/app/shared/widgets/doolay_feature.dart';
import 'package:doolay_front/app/shared/widgets/hello_widget.dart';
import 'package:flutter/material.dart';

class SmallPanel extends StatelessWidget {
  const SmallPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HelloWidget(),
        SizedBox(height: 16),
        FeaturesList(),
      ],
    );
  }
}
