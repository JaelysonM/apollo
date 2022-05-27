import 'package:apollo/constants/colors.dart';
import 'package:apollo/modals/signatures/cancel_service.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
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

  @override
  Widget build(BuildContext context) {
    String presentationName = account != null ? account!.name : 'Visitante';
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
      title: Text(
        'Olá, ${presentationName}!',
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: kSecondaryLightGray),
        textAlign: TextAlign.left,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, size: 30, color: Colors.white),
          onPressed: () {
            MutableModalContent.showModal(context, CancelService());
          },
          color: Colors.white,
          splashRadius: 20,
        )
      ],
    );
  }
}
