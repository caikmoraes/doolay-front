import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/widgets/doolay_textfield.dart';
import 'package:flutter/material.dart';

class FormUtils {
  static Widget showTiaOrDrt(
      Profile profile, TextEditingController ctr, Function validator) {
    return DoolayTextField(
      controller: ctr,
      label: profile == Profile.aluno ? 'TIA' : 'DRT',
      validator: (value) => validator(value),
    );
  }
}
