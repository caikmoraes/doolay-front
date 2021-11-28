
import 'dart:developer';

import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/repositories/sintomas_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

abstract class SintomasState {}

class SintomasList extends SintomasState{
  final List<Symptoms> sintomas;

  SintomasList(this.sintomas);
}

class InitSintomasState extends SintomasState{}

class SintomaCadastradoState extends SintomasState{
  final Symptoms sintoma;

  SintomaCadastradoState(this.sintoma);
}

class SintomaEdicaoState extends SintomasState{
  final Symptoms sintoma;

  SintomaEdicaoState(this.sintoma);
}


class SintomasStore extends NotifierStore<Exception, SintomasState> {
  final SintomasRepository repository;
  SintomasStore(this.repository) : super(InitSintomasState());

  Future fetchSintomas() async {
    setLoading(true);
    try {
      List<Symptoms> sintomas = await repository.fetchAll();
      update(SintomasList(sintomas));
    } catch(e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

  Future save(String sintoma) async {
    setLoading(true);
    try {
      Map<String, dynamic> json = <String, dynamic>{
        'nome': sintoma,
      };
      Symptoms novoSintoma = await repository.save(json);
      update(SintomaCadastradoState(novoSintoma));
    } catch(e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

  Future remove(int? id) async {
    setLoading(true);
    try {
      await repository.delete(id!);
      update(state);
    } catch(e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

  Future edit(String newDesc, Symptoms sintoma) async {
    setLoading(true);
    try {
      debugger();
      sintoma.nome = newDesc;
      Symptoms edited = await repository.update(sintoma.toJson(), sintoma.id!);
      update(SintomaEdicaoState(edited));
    } catch(e) {
      debugPrint('$e');
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

}