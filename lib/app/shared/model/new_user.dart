class NewUser {
  String? numIdentificacao;
  String? name;
  String? setor;
  String? tipoUsuario;
  String? password;
  String? cidade;
  String? estado;
  DateTime? dataNascimento;

  NewUser({
    this.numIdentificacao,
    this.name,
    this.setor,
    this.tipoUsuario,
    this.password,
    this.cidade,
    this.estado,
    this.dataNascimento,
  });

  NewUser.fromJson(Map<String, dynamic> json) {
    numIdentificacao = json['num_identificacao'];
    name = json['name'];
    setor = json['setor'];
    tipoUsuario = json['tipo_usuario'];
    password = json['password'];
    cidade = json['cidade'];
    estado = json['estado'];
    dataNascimento = DateTime.parse(json['data_nascimento']);
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {
      'num_identificacao': numIdentificacao,
      'name': name,
      'setor': setor,
      'tipoUsuario': tipoUsuario,
      'password': password,
      'cidade':cidade,
      'estado':estado,
      'data_nascimento': '${dataNascimento?.year}-${dataNascimento?.month}-${dataNascimento?.day}'
    };
    return data;
  }
}
