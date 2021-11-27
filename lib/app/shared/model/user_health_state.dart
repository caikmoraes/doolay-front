import 'package:doolay_front/app/shared/model/symptoms.dart';

class UserHealthState {
  int? id;
  String? user;
  String? estado;
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
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'user': user,
        'estado': estado,
      };

  static Future<List<UserHealthState>> fromJsonToList(List<dynamic> jsonList) async{
    List<UserHealthState> list = jsonList
        .map(
          (json) => UserHealthState(
            id: json['id'],
            user: json['user'],
            estado: json['estado'],
          ),
        )
        .toList();

    return list;
  }
}
