import 'package:flutter/material.dart';

class HelloWidget extends StatelessWidget {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 80),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const [
          Icon(
            Icons.account_circle,
            size: 64,
          ),
          SizedBox(width: 24),
          Text('Oi, fulano! Seu último acesso foi em _/_/_'),
        ],
      ),
    );
  }
}
