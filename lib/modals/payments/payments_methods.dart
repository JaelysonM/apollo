import 'package:apollo/modals/login/login_password_step.dart';
import 'package:apollo/modals/register/register_name_step.dart';
import 'package:apollo/models/credit_card.dart';
import 'package:apollo/widgets/containers/credit_card_list.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/tiny_text_field.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class PaymentsMethods extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  PaymentsMethods({Key? key, this.onNext}) : super(key: key);

  @override
  State<PaymentsMethods> createState() => _PaymentsMethods();
}

class _PaymentsMethods extends State<PaymentsMethods> {
  String _value = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultApproachHeader(
        title: "Formas de pagamento",
        titleFontSize: 18,
        description: "Adicione uma forma de pagamento à sua conta",
      ),
      const SizedBox(height: 25),
      TouchableOpacity(
          onTap: () {
            print('object');
          },
          child: Row(children: [
            const Icon(
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
      CreditCardList(cardList: [
        CreditCard(id: '1', lastNumbers: '9283', flag: CreditCardFlag.MASTER),
        CreditCard(id: '2', lastNumbers: '4512', flag: CreditCardFlag.VISA),
        CreditCard(id: '3', lastNumbers: '0493', flag: CreditCardFlag.HIPER),
        CreditCard(id: '4', lastNumbers: '9403', flag: CreditCardFlag.ELO),
        CreditCard(id: '5', lastNumbers: '1298', flag: CreditCardFlag.AMEX),
      ])
    ]);
  }
}
