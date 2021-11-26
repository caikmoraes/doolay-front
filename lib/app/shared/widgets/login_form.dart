import 'package:doolay_front/app/modules/auth/auth_store.dart';
import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'doolay_checkbox.dart';
import 'doolay_textfield.dart';
import 'loading_screen.dart';

class DoolayLoginForm extends StatefulWidget {
  const DoolayLoginForm({Key? key}) : super(key: key);

  @override
  State<DoolayLoginForm> createState() => _DoolayLoginFormState();
}

class _DoolayLoginFormState extends State<DoolayLoginForm> {
  TextEditingController tiaController = TextEditingController();

  TextEditingController passwordCtr = TextEditingController();
  bool? selected = false;
  clearControllers() {
    tiaController.clear();
    passwordCtr.clear();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final AuthStore authStore = Modular.get();
    return Form(
      key: key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            controller: tiaController,
            label: 'TIA ou DRT',
            validator: (value) => validateTIA(value),
          ),
          const SizedBox(height: 16),
          DoolayTextField(
            controller: passwordCtr,
            label: 'Senha',
            isPassword: true,
            validator: (String? value) =>
                value == null || value.isEmpty ? 'Preencha sua senha.' : null,
          ),
          const SizedBox(height: 8),
          DoolayCheckBox(
            text: 'Lembre-se de mim.',
            action: (bool? value) => setState((){
              selected = value;
            }),
          ),
          const SizedBox(height: 8),
          ScopedBuilder(
            store: authStore,
            onLoading: (context) => const LoadingScreen(),
            onState: (context, state) => DoolayLoginButton(
              onTap: () => sendLogin(key, authStore),
            ),
            onError: (context, error) => Column(
              children: [
                DoolayErrorAlert(text: '$error'),
                DoolayLoginButton(
                  onTap: () => sendLogin(key, authStore),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sendLogin(GlobalKey<FormState> key, AuthStore store) {
    if (key.currentState!.validate()) {
      return store.login(
        tiaController.text,
        passwordCtr.text,
      );
    }
  }

  String? validateTIA(value) => value == null ? 'Campo obrigatório' : null;
}

class DoolayLoginButton extends StatelessWidget {
  final Function onTap;

  const DoolayLoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => onTap(),
            child: const Text('Entrar'),
          ),
        ),
      ],
    );
  }
}

class DoolaySelectedProfile extends StatelessWidget {
  final String label;
  final Profile? currentValue;
  final Profile baseValue;
  final Function onSelect;

  const DoolaySelectedProfile({
    Key? key,
    required this.label,
    required this.currentValue,
    required this.baseValue,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => onSelect(baseValue),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentValue == baseValue
                ? Styles.PRIMARY_COLOR
                : Colors.transparent,
          ),
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
