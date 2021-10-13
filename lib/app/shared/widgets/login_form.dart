import 'package:doolay_front/app/modules/auth/auth_store.dart';
import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/utils/form_utils.dart';
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
  final TextEditingController tiaOrDrtCtr = TextEditingController();

  final TextEditingController passwordCtr = TextEditingController();

  Profile? profile = Profile.aluno;

  clearControllers() {
    tiaOrDrtCtr.clear();
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
          const Text('Selecione seu perfil:'),
          const SizedBox(height: 8),
          Row(
            children: [
              DoolaySelectedProfile(
                baseValue: Profile.aluno,
                currentValue: profile,
                label: 'Aluno',
                onSelect: (Profile? value) => setState(() {
                  clearControllers();
                  profile = value;
                }),
              ),
              const SizedBox(width: 8),
              DoolaySelectedProfile(
                baseValue: Profile.funcionario,
                currentValue: profile,
                label: 'Funcionario',
                onSelect: (Profile? value) => setState(() {
                  clearControllers();
                  profile = value;
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FormUtils.showTiaOrDrt(
            profile!,
            tiaOrDrtCtr,
            (value) =>
                value == null || value.isEmpty ? 'Preencha seu login.' : null,
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
          const DoolayCheckBox(
            text: 'Lembre-se de mim.',
          ),
          const SizedBox(height: 8),
          ScopedBuilder(
            store: authStore,
            onLoading: (context) => const LoadingScreen(),
            onState: (context, state) => DoolayLoginButton(
              onTap: () {
                if (key.currentState!.validate()) {
                  return authStore.login(
                    tiaOrDrtCtr.text,
                    passwordCtr.text,
                    profile,
                  );
                }
              },
            ),
            onError: (context, error) => Column(
              children: [
                DoolayErrorAlert(text: '$error'),
                DoolayLoginButton(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      return authStore.login(
                        tiaOrDrtCtr.text,
                        passwordCtr.text,
                        profile,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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

class DoolayErrorAlert extends StatefulWidget {
  final String text;
  const DoolayErrorAlert({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<DoolayErrorAlert> createState() => _DoolayErrorAlertState();
}

class _DoolayErrorAlertState extends State<DoolayErrorAlert> {
  bool showing = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showing,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(widget.text),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 10,
                  child: InkWell(
                    child: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                    onTap: () => setState(() {
                      showing = !showing;
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
