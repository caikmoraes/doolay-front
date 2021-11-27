import 'package:doolay_front/app/shared/app_constants.dart';
import 'package:doolay_front/app/shared/doolay_menu.dart';
import 'package:doolay_front/app/shared/layout/style.dart';
import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/widgets/arrow_back.dart';
import 'package:doolay_front/app/shared/widgets/doolay_alerts.dart';
import 'package:doolay_front/app/shared/widgets/doolay_button.dart';
import 'package:doolay_front/app/shared/widgets/doolay_page_subheader.dart';
import 'package:doolay_front/app/shared/widgets/doolay_textfield.dart';
import 'package:doolay_front/app/shared/widgets/form_base.dart';
import 'package:doolay_front/app/shared/widgets/loading_screen.dart';
import 'package:doolay_front/app/shared/widgets/page_base.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SintomasPage extends StatefulWidget {
  final String title;

  const SintomasPage({Key? key, this.title = 'SintomasPage'}) : super(key: key);

  @override
  SintomasPageState createState() => SintomasPageState();
}

class SintomasPageState extends State<SintomasPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final SintomasStore store = Modular.get();
  final SintomasStore newSintomaStore = Modular.get();
  final TextEditingController sintomaCtr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    store.fetchSintomas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      appBar: doolayMenu(scaffoldKey, context),
      drawer: doolayDrawer(scaffoldKey, context),
      body: PageBase(
        background: AppConstants.BACKGROUND_USU,
        child: FormBase(
          child: SizedBox(
            height: height * .8,
            child: Column(
              children: [
                const ArrowBackHeader(),
                const SizedBox(height: 8),
                const DoolayPageSubHeader(text: 'Sintomas:'),
                const SizedBox(height: 8),
                Expanded(
                  child: ScopedBuilder(
                    store: store,
                    onError: (_, error) => DoolayErrorAlert(text: '$error'),
                    onLoading: (_) => const Center(child: LoadingScreen()),
                    onState: (_, state) {
                      state = state as SintomasList;
                      List<Symptoms> sintomas = state.sintomas;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: sintomas.length,
                        itemBuilder: (context, index) => Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            hoverColor: Styles.PRIMARY_COLOR.withOpacity(.5),
                            title: Text('${sintomas[index].nome}'),
                            trailing: PopupMenuButton(
                              tooltip: 'Ações',
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry>[
                                PopupMenuItem(
                                  child: Row(
                                    children: const [
                                      Icon(Icons.edit),
                                      SizedBox(width: 8),
                                      Text('Editar')
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: const [
                                      Icon(Icons.remove),
                                      SizedBox(width: 8),
                                      Text('Excluir'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: DoolayButton(
                    text: 'Novo sintoma',
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ScopedBuilder(
                        store: newSintomaStore,
                        onError: (_, error) => AlertDialog(
                          title: const Text('Erro'),
                          content: Text('$error'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                        onLoading: (_) => const AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: LoadingScreen(),
                        ),
                        onState: (_, state) {
                          if (state is InitSintomasState) {
                            return AlertDialog(
                              content: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const DoolayPageSubHeader(
                                        text: 'Novo Sintoma:'),
                                    const SizedBox(height: 16),
                                    DoolayTextField(
                                        controller: sintomaCtr,
                                        label: 'Ex: "Dor de cabeça"',
                                        validator: (value) => value == null
                                            ? 'Preencha o nome do sintoma'
                                            : null),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  child: const Text('Salvar'),
                                  onPressed: () async {
                                    if(formKey.currentState!.validate()){
                                      await newSintomaStore.save(sintomaCtr.text);
                                      store.fetchSintomas();
                                    }
                                  },
                                )
                              ],
                            );
                          } else if (state is SintomaCadastradoState) {
                            return AlertDialog(
                              content:
                                  const Text('Sintoma cadastrado com sucesso'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
