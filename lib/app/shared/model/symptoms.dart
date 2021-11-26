class Symptoms {
  int? id;
  String? nome;

  Symptoms({this.nome, this.id});

  static List<Symptoms> fromJsonToList(List<dynamic> json) {
    List<Symptoms> list = json
        .map(
          (e) => Symptoms(id: e['id'], nome: e['nome']),
        )
        .toList();

    return list;
  }
}

class ItemSymptom {
  int? id;
  int? sintoma;
  int? estadoSaude;
  bool? apresenta;

  ItemSymptom({
    this.id,
    this.sintoma,
    this.estadoSaude,
    this.apresenta,
  });

  ItemSymptom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sintoma = json['sintoma'];
    estadoSaude = json['estado_saude'];
    apresenta = json['apresenta'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sintoma': '$sintoma',
        'estado_saude': '$estadoSaude',
        'apresenta': '$apresenta',
      };

}
