import 'dart:developer';

import 'package:doolay_front/app/modules/setor/setor_store.dart';
import 'package:doolay_front/app/modules/user/user_store.dart';
import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/model/new_user.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/doolay_date_picker.dart';
import 'package:doolay_front/app/shared/widgets/doolay_select_field.dart';
import 'package:doolay_front/app/shared/widgets/doolay_textfield.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/login_form.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  final String title;

  const UserPage({
    Key? key,
    this.title = 'UserPage',
  }) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  // final UserStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: doolayMenu(_key, context),
      drawer: doolayDrawer(_key, context),
      body: const PageBase(
        background: AppConstants.BACKGROUND_USU,
        child: UserForm(),
      ),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController tiaOrDrtCtr = TextEditingController();
  final TextEditingController fullNameCtr = TextEditingController();
  final TextEditingController senhaCtr = TextEditingController();
  final TextEditingController dataNascimentoCtr = TextEditingController();
  final MaskTextInputFormatter dateMask = MaskTextInputFormatter(
      mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});
  final TextEditingController setorCtr = TextEditingController();
  final TextEditingController cidadeCtr = TextEditingController();
  final TextEditingController estadoCtr = TextEditingController();
  final UserStore store = Modular.get();
  final SetorStore setorStore = Modular.get();

  Profile? profile = Profile.aluno;
  Setor? currentSetor;

  @override
  void initState() {
    setorStore.fetchSetores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBase(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ArrowBackHeader(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  children: [
                    DoolayTextField(
                      controller: fullNameCtr,
                      label: 'Nome Completo',
                      validator: (value) =>
                          value == null ? 'Preencha o nome.' : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          DoolaySelectedProfile(
                            baseValue: Profile.aluno,
                            currentValue: profile,
                            label: 'Aluno',
                            onSelect: (Profile? value) => setState(() {
                              profile = value;
                            }),
                          ),
                          const SizedBox(width: 16),
                          DoolaySelectedProfile(
                            baseValue: Profile.funcionario,
                            currentValue: profile,
                            label: 'Funcionario',
                            onSelect: (Profile? value) => setState(() {
                              profile = value;
                            }),
                          ),
                        ],
                      ),
                    ),
                    ResponsiveTool.isLargeScreen(context)
                        ? Row(
                            children: [
                              Expanded(
                                child: DoolayTextField(
                                  controller: tiaOrDrtCtr,
                                  label: 'Preencha o TIA ou DRT',
                                  validator: (value) => value == null
                                      ? 'Campo obrigatório'
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: ScopedBuilder(
                                      store: setorStore,
                                      onError: (context, error) =>
                                          DoolayErrorAlert(text: '$error'),
                                      onLoading: (context) => const LinearProgressIndicator(),
                                      onState: (context, state) {
                                        if (state is ListSetor) {
                                          return DoolaySelectSetorField(
                                              arrayValues: state.setores ?? [],
                                              onChange: (Setor? value) => setState((){
                                                currentSetor = value;
                                              }),
                                              label: 'Setor');
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: DoolayDatePicker(
                                  controller: dataNascimentoCtr,
                                  label: 'Data de Nascimento',
                                  mask: dateMask,
                                  onPicked: () => showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      String date =
                                          '${value.day}/${value.month}/${value.year}';
                                      return dataNascimentoCtr.text = date;
                                    }
                                  }),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              DoolayTextField(
                                controller: tiaOrDrtCtr,
                                label: 'Preencha o TIA ou DRT',
                                validator: (value) =>
                                    value == null ? 'Campo obrigatório' : null,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: ScopedBuilder(
                                      store: setorStore,
                                      onError: (context, error) =>
                                          DoolayErrorAlert(text: '$error'),
                                      onLoading: (context) => const LinearProgressIndicator(),
                                      onState: (context, state) {
                                        if (state is ListSetor) {
                                          return DoolaySelectSetorField(
                                              arrayValues: state.setores ?? [],
                                              onChange: (Setor? value) => setState((){
                                                currentSetor = value;
                                              }),
                                              label: 'Setor');
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              DoolayDatePicker(
                                controller: dataNascimentoCtr,
                                label: 'Data de Nascimento',
                                mask: dateMask,
                                onPicked: () => showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  if (value != null) {
                                    String date =
                                        '${value.day}/${value.month}/${value.year}';
                                    return dataNascimentoCtr.text = date;
                                  }
                                }),
                              ),
                            ],
                          ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DoolayTextField(
                            controller: cidadeCtr,
                            label: 'Cidade',
                            validator: (value) =>
                                value == null ? 'Campo obrigatório' : null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DoolaySelectField(
                              arrayValues: getUFs(),
                              onChange: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    estadoCtr.text = value;
                                  });
                                }
                              },
                              label: 'UF'),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    ScopedBuilder(
                      store: store,
                      onState: (context, NewUser state) {
                        return Column(
                          children: [
                            if (state.numIdentificacao != null)
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green[50],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(
                                      child: Text(
                                        'Cadastrado realizado',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            DoolayButton(
                              text: 'Cadastrar',
                              onTap: () async {
                                cadastrarUsuario();
                              },
                            ),
                          ],
                        );
                      },
                      onLoading: (context) => const LoadingScreen(),
                      onError: (context, error) => Column(
                        children: [
                          DoolayErrorAlert(text: '$error'),
                          DoolayButton(
                            text: 'Cadastrar',
                            onTap: () async {
                              cadastrarUsuario();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getUFs() => [
        'AC',
        'AL',
        'AP',
        'AM',
        'BA',
        'CE',
        'DF',
        'ES',
        'GO',
        'MA',
        'MS',
        'MT',
        'MG',
        'PA',
        'PB',
        'PR',
        'PE',
        'PI',
        'RJ',
        'RN',
        'RS',
        'RO',
        'RR',
        'SC',
        'SP',
        'SE',
        'TO',
      ];

  void cadastrarUsuario() {
    debugger();
    DateFormat format = DateFormat('dd/MM/yyyy');
    NewUser newUser = NewUser(
      name: fullNameCtr.text,
      cidade: cidadeCtr.text,
      dataNascimento: format.parse(dataNascimentoCtr.text),
      estado: estadoCtr.text,
      numIdentificacao: tiaOrDrtCtr.text,
      password: senhaCtr.text,
      setor: setorCtr.text,
      tipoUsuario: profile == Profile.aluno ? 'ALU' : 'FUN',
    );
    var json = newUser.toJson();
    store.saveNewUser(json);
  }
}
