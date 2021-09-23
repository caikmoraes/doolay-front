import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const FeatureWidget({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 64,
          ),
          const SizedBox(height: 8),
          SelectableText(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
