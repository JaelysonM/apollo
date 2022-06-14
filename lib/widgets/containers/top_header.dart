import 'package:apollo/models/account.dart';
import 'package:apollo/models/user.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/evaluation.dart';
import 'package:apollo/widgets/elements/apollo_seal.dart';
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

  Widget _renderEvaluation() {
    return Row(
      children: [
        if (account!.evaluation != account!.lastEvaluation) ...[
          const SizedBox(width: 10),
          (account!.evaluation >= account!.lastEvaluation
              ? const Icon(
                  Icons.keyboard_arrow_up,
                  color: kLightGreen,
                  size: 14,
                )
              : const Icon(
                  Icons.keyboard_arrow_down,
                  color: kErrorRed,
                  size: 14,
                )),
        ],
        Evaluation(fontSize: 15, evaluation: account!.evaluation)
      ],
    );
  }

  Widget _renderApolloSeal() {
    if (account is User && (account as User).isApollo == true) {
      return const ApolloSeal();
    } else {
      return Container();
    }
  }

  Widget _renderAccountInfo() {
    return Row(
      children: [
        _renderEvaluation(),
        const SizedBox(
          width: 10,
        ),
        _renderApolloSeal()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String presentationName =
        account != null ? account!.getPresentation() : 'Visitante';
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
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Olá, $presentationName',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryLightGray),
                textAlign: TextAlign.left),
            if (account != null) _renderAccountInfo()
          ]),
    );
  }
}
