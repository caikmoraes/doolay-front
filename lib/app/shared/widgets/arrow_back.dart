import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ArrowBackHeader extends StatelessWidget {
  const ArrowBackHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ],
    );
  }
}
