import 'dart:developer';

import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PanelStore extends StreamStore<Exception, User> {
  final User initialState;
  PanelStore(this.initialState) : super(initialState);

  Future<User?> fetchUserDetails(String userId, String profile) async {
    try {
      UserRepository repo = Modular.get();
      UserModel? model = await repo.fetchUserDetails(userId, profile);
      if (model != null) {
        User? user = model.user;
        return user;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }
}
