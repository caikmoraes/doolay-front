import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:flutter/material.dart';

class HelloWidget extends StatelessWidget {
  final User user;
  const HelloWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 80),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Icon(
            Icons.account_circle,
            size: 64,
          ),
          const SizedBox(width: 24),
          Text(
              'Oi, ${user.firstName}! ${user.lastLogin == null ? 'Seja bem-vindo ao Doolay :)' : 'Seu último acesso foi em ${user.lastLogin!.day}/${user.lastLogin!.month}/${user.lastLogin!.year}'}'),
        ],
      ),
    );
  }
}
