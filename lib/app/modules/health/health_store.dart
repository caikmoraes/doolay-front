import 'dart:developer';

import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:doolay_front/app/shared/enum/health_state.dart';
import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/model/user_health_state.dart';
import 'package:doolay_front/app/shared/repositories/health_state_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HealthStore extends NotifierStore<Exception, int> {
  HealthStore() : super(0);

  Future saveHealthState(
      HealthState healthState, List<Symptoms> sintomas) async {
    setLoading(true);
    try {
      debugger();
      PanelStore panelStore = Modular.get();
      HealthStateRepository repo = Modular.get();
      UserHealthState state = UserHealthState(
        estado: healthState == HealthState.ok ? 'OK' : 'NOK',
        user: panelStore.getUserID(),
      );
      state = await repo.saveHealthState(state.toJson());
      if (state.id == null) throw Exception('Erro ao registrar estado de saúde');
      if (state.estado != 'OK') {
        for (var s in sintomas) {
          ItemSymptom item = ItemSymptom(
            apresenta: true,
            estadoSaude: state.id,
            sintoma: s.id,
          );
          item = await repo.saveItemHealthState(item.toJson());
          if (item.id == null) throw Exception('Erro ao registrar sintomas');
        }
      }
      update(1);
    } catch (e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }
}
