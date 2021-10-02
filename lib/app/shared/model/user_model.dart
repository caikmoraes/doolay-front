import 'dart:developer';

class UserModel {
  String? numMatricula;
  User? user;

  UserModel({this.numMatricula, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    numMatricula = json['num_matricula'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num_matricula'] = numMatricula;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? password;
  DateTime? lastLogin;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  DateTime? dataNascimento;
  String? cidade;
  String? estado;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User(
      {this.id,
      this.password,
      this.lastLogin,
      this.isSuperuser,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.dataNascimento,
      this.cidade,
      this.estado,
      this.groups,
      this.userPermissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'] != null
        ? DateTime.tryParse(json['last_login'])
        : null;
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = DateTime.tryParse(json['date_joined']);
    dataNascimento = json['data_nascimento'] != null
        ? DateTime.tryParse(json['data_nascimento'])
        : null;
    cidade = json['cidade'];
    estado = json['estado'];
    if (json['groups'] != null) {
      groups = [];
      json['groups'].forEach((v) {
        groups!.add(v);
      });
    }
    if (json['user_permissions'] != null) {
      userPermissions = [];
      json['user_permissions'].forEach((v) {
        userPermissions!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['last_login'] = lastLogin;
    data['is_superuser'] = isSuperuser;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['is_staff'] = isStaff;
    data['is_active'] = isActive;
    data['date_joined'] = dateJoined;
    data['data_nascimento'] = dataNascimento;
    data['cidade'] = cidade;
    data['estado'] = estado;
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    if (userPermissions != null) {
      data['user_permissions'] =
          userPermissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
