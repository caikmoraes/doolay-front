import 'package:doolay_front/app/shared/model/symptoms.dart';

class UserHealthState {
  int? id;
  String? user;
  String? estado;
  DateTime? date;
  List<ItemSymptom>? sintomas;

  UserHealthState({
    this.id,
    this.user,
    this.estado,
    this.sintomas,
  });

  UserHealthState.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    estado = json['estado'];
    if(json['sintomas'] != null) {
      sintomas = ItemSymptom.fromJsonToList(json['sintomas']);
    }
    if(json['date'] != null) {
      date = DateTime.parse(json['date']);
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'user': user,
        'estado': estado,
      };

  static Future<List<UserHealthState>> fromJsonToList(List<dynamic> jsonList) async{
    List<UserHealthState> list = jsonList
        .map(
          (json) => UserHealthState.fromJson(json)
        )
        .toList();

    return list;
  }
}
