import 'package:apollo/constants/globals.dart';
import 'package:apollo/widgets/containers/all_subscriptions.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/widgets.dart';

class SubscriptionsLoggedOut extends StatelessWidget {
  const SubscriptionsLoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenHeader(
            showDate: true,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 145),
              child: const MixedText([
                TextSpan(text: 'Você tem '),
                TextSpan(
                    text: 'nenhuma ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'assinatura'),
              ], size: 16, weight: FontWeight.w300),
            )),
        AllSubscriptions(
          subscriptionPlans: SUBSCRIPTION_PLANS_MOCK,
        )
      ],
    );
  }
}
