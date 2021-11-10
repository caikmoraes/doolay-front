import 'package:flutter/material.dart';

class CovidWhatIs extends StatelessWidget {
  const CovidWhatIs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
          'O coronavírus (COVID-19) é uma doença infecciosa causada pelo vírus SARS-CoV-2.\n\nA maioria das pessoas que adoece em decorrência da COVID-19 apresenta sintomas leves a moderados e se recupera sem tratamento especial. No entanto, algumas desenvolvem um quadro grave e precisam de atendimento médico.'),
    );
  }
}
