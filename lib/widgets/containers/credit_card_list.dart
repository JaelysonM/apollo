import 'package:apollo/models/credit_card.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class CreditCardList extends StatelessWidget {
  final List<CreditCard> cardList;
  const CreditCardList({Key? key, required this.cardList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: cardList.map((card) => _renderCard(card)).toList());
  }

  Widget _renderCard(CreditCard card) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          card.getFlagImage().make(),
          SizedBox(width: 10),
          TinyText(
            content: 'Final do cartão ${card.lastNumbers}',
            fontSize: 14,
          )
        ]));
  }
}
