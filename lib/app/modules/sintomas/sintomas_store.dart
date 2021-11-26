import 'dart:developer';

import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/repositories/sintomas_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

abstract class SintomasState {}

class SintomasList extends SintomasState{
  final List<Symptoms> sintomas;

  SintomasList(this.sintomas);
}

class InitSintomasState extends SintomasState{}


class SintomasStore extends NotifierStore<Exception, SintomasState> {

  SintomasStore() : super(InitSintomasState());

  Future fetchSintomas() async {
    setLoading(true);
    try {
      SintomasRepository repository = Modular.get();
      List<Symptoms> sintomas = await repository.fetchAll();
      update(SintomasList(sintomas));
    } catch(e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

}