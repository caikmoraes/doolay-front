import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/doolay_date_picker.dart';
import 'package:doolay_front/app/shared/widgets/doolay_select_field.dart';
import 'package:doolay_front/app/shared/widgets/doolay_textfield.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/user/user_store.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String title;
  const UserPage({Key? key, this.title = 'UserPage'}) : super(key: key);
  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  final UserStore store = Modular.get();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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
  final TextEditingController setorCtr = TextEditingController();
  final TextEditingController cidadeCtr = TextEditingController();
  final TextEditingController estadoCtr = TextEditingController();
  Profile? profile = Profile.aluno;
  @override
  Widget build(BuildContext context) {
    return FormBase(
      child: Column(
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 170,
                        child: RadioListTile<Profile?>(
                          title: const Text('Aluno'),
                          groupValue: profile,
                          value: Profile.aluno,
                          onChanged: (value) => setState(() {
                            profile = value;
                          }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 170,
                        child: RadioListTile<Profile?>(
                          title: const Text('Funcionário'),
                          groupValue: profile,
                          value: Profile.funcionario,
                          onChanged: (value) => setState(() {
                            profile = value;
                          }),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: showTiaOrDrt(profile, tiaOrDrtCtr),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DoolayDatePicker(
                          controller: dataNascimentoCtr,
                          label: 'Data de Nascimento',
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
                  ),
                  const SizedBox(height: 16),
                  DoolaySelectField(
                    arrayValues: const ['Administrativo', 'Financeiro'],
                    onChange: (String? value) {
                      if (value != null) {
                        setState(() {
                          setorCtr.text = value;
                        });
                      }
                    },
                    label: 'Setor',
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: DoolaySelectField(
                            arrayValues: const ['Osasco', 'São Paulo'],
                            onChange: (String? value) {
                              if (value != null) {
                                setState(() {
                                  cidadeCtr.text = value;
                                });
                              }
                            },
                            label: 'Cidade'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DoolaySelectField(
                            arrayValues: const ['SP', 'RJ'],
                            onChange: (String? value) {
                              if (value != null) {
                                setState(() {
                                  cidadeCtr.text = value;
                                });
                              }
                            },
                            label: 'UF'),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  DoolayButton(
                    text: 'Cadastrar',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showTiaOrDrt(Profile? profile, TextEditingController ctr) {
    return DoolayTextField(
      controller: ctr,
      label: profile == Profile.aluno ? 'TIA' : 'DRT',
    );
  }
}
