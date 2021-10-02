import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:flutter/material.dart';

class DoolayUserTypeRadio extends StatefulWidget {
  final Function onSelect;
  const DoolayUserTypeRadio({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  _DoolayUserTypeRadioState createState() => _DoolayUserTypeRadioState();
}

class _DoolayUserTypeRadioState extends State<DoolayUserTypeRadio> {
  Profile? profile = Profile.aluno;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildRadio(
          text: 'Aluno',
          defaultValue: Profile.aluno,
        ),
        buildRadio(
          text: 'Funcionário',
          defaultValue: Profile.funcionario,
        ),
      ],
    );
  }

  Widget buildRadio({
    required String text,
    required Profile? defaultValue,
  }) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: RadioListTile<Profile?>(
          title: Text(text),
          groupValue: profile,
          value: defaultValue,
          onChanged: (value) {
            setState(() {
              profile = value;
            });
            widget.onSelect(value);
          },
        ),
      );
}
