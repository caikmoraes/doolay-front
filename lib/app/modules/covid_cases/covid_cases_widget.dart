import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/covid_cases/covid_cases_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CovidCasesWidget extends StatefulWidget {
    final double? height;
  const CovidCasesWidget({Key? key, required this.height})
      : super(key: key);

  @override
  CovidCasesWidgetState createState() => CovidCasesWidgetState();
}

class CovidCasesWidgetState extends State<CovidCasesWidget> {
  final CovidCasesStore store = Modular.get();

  @override
  void initState() {
    store.fetchCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      height: widget.height,
      width: const BoxConstraints.expand().maxWidth,
      child: ScopedBuilder(
        store: store,
        onError: (_, error) => Center(child: Text('$error')),
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.coronavirus, size: 56),
            Text(
              '$state',
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
