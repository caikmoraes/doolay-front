import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:flutter/material.dart';

class CovidMainSymptoms extends StatelessWidget {
  const CovidMainSymptoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Mais Comuns:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...getCommonSympomts().map(
                (e) => Text('\u2022 ${e.description}'),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mais Raros:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...getRareSympomts().map(
                (e) => Text('\u2022 ${e.description}'),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mais Graves:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...getDangerousSympomts().map(
                (e) => Text('\u2022 ${e.description}'),
          ),
        ],
      ),
    );
  }

  List<Symptoms> getCommonSympomts() => [
    Symptoms('Febre'),
    Symptoms('Tosse'),
    Symptoms('Cansaço'),
    Symptoms('Perda de paladar ou olfato'),
  ];

  List<Symptoms> getRareSympomts() => [
    Symptoms('Dores de garganta'),
    Symptoms('Dor de cabeça'),
    Symptoms('Dores e desconfortos'),
    Symptoms('Diarreia'),
    Symptoms(
        'Irritações na pele ou descoloração dos dedos dos pés ou das mãos'),
    Symptoms('Olhos vermelhos ou irritados'),
  ];

  List<Symptoms> getDangerousSympomts() => [
    Symptoms('Dificuldade para respirar ou falta de ar'),
    Symptoms('Perda da fala, mobilidade ou confusão'),
    Symptoms('Dores no peito'),
  ];
}
