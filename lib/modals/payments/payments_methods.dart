import 'package:apollo/models/credit_card.dart';
import 'package:apollo/widgets/containers/credit_card_list.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';
import 'package:flutter/material.dart';

class PaymentsMethods extends StatefulWidget {
  final List<CreditCard>? creditCards;
  final TextEditingController textEditingController = TextEditingController();

  final Function? onNext;

  PaymentsMethods({Key? key, this.onNext, this.creditCards}) : super(key: key);

  @override
  State<PaymentsMethods> createState() => _PaymentsMethods();
}

class _PaymentsMethods extends State<PaymentsMethods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const DefaultApproachHeader(
        title: "Formas de pagamento",
        titleFontSize: 18,
        description: "Adicione uma forma de pagamento à sua conta",
      ),
      const SizedBox(height: 25),
      TouchableOpacity(
          onTap: () {},
          child: Row(children: const [
            Icon(
              Icons.credit_card,
              color: Colors.white,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Adicionar cartão de crédito',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ])),
      const SizedBox(
        height: 20,
      ),
      if (widget.creditCards != null)
        CreditCardList(cardList: widget.creditCards!)
    ]);
  }
}
