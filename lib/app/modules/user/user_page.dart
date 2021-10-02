import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/layout/responsive.dart';
import 'package:doolay_front/app/shared/utils/form_utils.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/doolay_date_picker.dart';
import 'package:doolay_front/app/shared/widgets/doolay_select_field.dart';
import 'package:doolay_front/app/shared/widgets/doolay_textfield.dart';
import 'package:doolay_front/app/shared/widgets/doolay_user_type_radio.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/login_form.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController setorCtr = TextEditingController();
  final TextEditingController cidadeCtr = TextEditingController();
  final TextEditingController estadoCtr = TextEditingController();
  Profile? profile = Profile.aluno;

  clearControllers() {
    tiaOrDrtCtr.clear();
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
                              clearControllers();
                              profile = value;
                            }),
                          ),
                          const SizedBox(width: 16),
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
                    ),
                    ResponsiveTool.isLargeScreen(context)
                        ? Row(
                            children: [
                              Expanded(
                                child: FormUtils.showTiaOrDrt(
                                  profile!,
                                  tiaOrDrtCtr,
                                  (value) => value == null
                                      ? 'Preencha seu TIA ou DRT.'
                                      : null,
                                ),
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
                          )
                        : Column(
                            children: [
                              FormUtils.showTiaOrDrt(
                                profile!,
                                tiaOrDrtCtr,
                                (value) => value == null
                                    ? 'Preencha seu TIA ou DRT.'
                                    : null,
                              ),
                              const SizedBox(height: 16),
                              DoolayDatePicker(
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
                          flex: 2,
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
      ),
    );
  }
}
