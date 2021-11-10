import 'package:doolay_front/app/shared/model/prevention.dart';
import 'package:flutter/material.dart';

class CovidPrevention extends StatelessWidget {
  const CovidPrevention({Key? key}) : super(key: key);

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
            'Para evitar a propagação da COVID-19, siga estas orientações:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...getPreventions().map(
                (e) => Text('\u2022 ${e.description}\n'),
          ),
        ],
      ),
    );
  }

  List<Prevention> getPreventions() => [
    Prevention(
        'Mantenha uma distância segura de outras pessoas (pelo menos 1 metro), mesmo que elas não pareçam estar doentes;'),
    Prevention(
        'Use máscara em público, especialmente em locais fechados ou quando não for possível manter o distanciamento físico;'),
    Prevention(
        'Prefira locais abertos e bem ventilados em vez de ambientes fechados. Abra uma janela se estiver em um local fechado;'),
    Prevention(
        'Limpe as mãos com frequência. Use sabão e água ou álcool em gel'),
    Prevention(
        'Tome a vacina quando chegar a sua vez. Siga as orientações locais para isso'),
    Prevention(
        'Cubra o nariz e a boca com o braço dobrado ou um lenço ao tossir ou espirrar'),
    Prevention('Fique em casa se você sentir indisposição'),
  ];
}
