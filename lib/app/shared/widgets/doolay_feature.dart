import 'package:doolay_front/app/shared/features/panel_features.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DoolayFeature extends StatelessWidget {
  final IconData icon;
  final String description;
  final String route;

  const DoolayFeature({
    Key? key,
    required this.icon,
    required this.description,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Styles.SECONDARY_COLOR,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(2, 2),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ]),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 56,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        onTap: () => Modular.to.pushNamed(route),
      ),
    );
  }
}

class FeaturesList extends StatelessWidget {
  const FeaturesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _ctr = ScrollController();
    return Expanded(
      child: Scrollbar(
        controller: _ctr,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _ctr,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: getFeatures(context)
                .map(
                  (feature) => DoolayFeature(
                    icon: feature.icon,
                    description: feature.description,
                    route: feature.route!,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
