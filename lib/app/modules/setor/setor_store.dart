
import 'package:doolay_front/app/modules/user/user_store.dart';
import 'package:doolay_front/app/shared/repositories/setor_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

abstract class SetorState{}

class NullState extends SetorState{}

class ListSetor extends SetorState{
  List<Setor>? setores;

  ListSetor({this.setores});

}

class CurrentSetor extends SetorState{
  Setor? setor;

  CurrentSetor({this.setor});
}

class SetorStore extends NotifierStore<Exception, SetorState> {
  SetorStore() : super(NullState());

  Future fetchSetores() async {
    setLoading(true);
    try {
      SetorRepository setorRepo = Modular.get();
      List<Setor>? list = await setorRepo.fetchAll();
      update(ListSetor(setores: list));
    } catch(e) {
      debugPrint('$e');
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }
}