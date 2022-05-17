import 'package:apollo/modals/auth/identify_approach.dart';

import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/account.dart';
import 'current_date_container.dart';

class ScreenHeader extends StatelessWidget {
  final Account? account;
  final Widget child;
  const ScreenHeader({Key? key, required this.child, this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String presentationName = account != null ? account!.name : 'Visitante';

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Olá, ${presentationName}!',
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryLightGray),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  icon:
                      const Icon(Icons.settings, size: 30, color: Colors.white),
                  onPressed: () {
                    MutableModalContent.showModal(context, IdentifyApproach());
                  },
                  color: Colors.white,
                  splashRadius: 20,
                )
              ],
            ),
            const SizedBox(height: 36),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CurrentDateContainer(),
                    child,
                  ],
                ))
          ],
        ));
  }
}
