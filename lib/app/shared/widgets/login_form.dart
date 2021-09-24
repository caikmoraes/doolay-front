import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'doolay_checkbox.dart';
import 'doolay_textfield.dart';

class DoolayLoginForm extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  DoolayLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            'Olá!',
            style: Theme.of(context).textTheme.headline2,
          ),
          SelectableText(
            'Que bom te ver :)',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 16),
          DoolayTextField(
            controller: loginController,
            label: 'TIA ou DRT',
          ),
          const SizedBox(height: 16),
          DoolayTextField(
            controller: passController,
            label: 'Senha',
            isPassword: true,
          ),
          const SizedBox(height: 8),
          const DoolayCheckBox(
            text: 'Lembre-se de mim.',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Modular.to.navigate('/panel/'),
                  child: const Text('Entrar'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
