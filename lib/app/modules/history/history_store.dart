import 'dart:developer';

import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:doolay_front/app/shared/model/user_health_state.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/repositories/health_state_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HistoryStore extends NotifierStore<Exception, List<UserHealthState>> {

  HistoryStore() : super([]);

  Future fetchHealthHistory() async {
    setLoading(true);
    try {
      HealthStateRepository repo = Modular.get();
      PanelStore panelStore = Modular.get();
      String? userID = panelStore.getUserID();
      if(userID == null) {
        Modular.to.pushReplacementNamed('/auth/');
      }
      List<UserHealthState> history = await repo.fetchByUser(userID!);
      update(history);
    } catch(e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

}