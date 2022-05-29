import 'package:apollo/constants/colors.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/widgets/containers/evaluation.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Account? account;

  TopHeader({
    Key? key,
    this.account,
  })  : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  List<Widget> _renderAccountInfo() {
    return [
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: Evaluation(fontSize: 15, evaluation: account!.evaluation!),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    String presentationName =
        account != null ? account!.getFirstName() : 'Visitante';
    return AppBar(
      backgroundColor: kThemeBackground,
      elevation: 0,
      leadingWidth: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('Olá, ${presentationName}',
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kSecondaryLightGray),
            textAlign: TextAlign.left),
        if (account != null) ..._renderAccountInfo()
      ]),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, size: 30, color: Colors.white),
          onPressed: () {},
          color: Colors.white,
          splashRadius: 20,
        )
      ],
    );
  }
}
