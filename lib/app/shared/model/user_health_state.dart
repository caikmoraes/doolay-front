class UserHealthState {
  int? id;
  String? user;
  String? estado;

  UserHealthState({
    this.id,
    this.user,
    this.estado,
  });

  UserHealthState.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    estado = json['estado'];
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
