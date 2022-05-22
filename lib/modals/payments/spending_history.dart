import 'package:apollo/models/spend.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:flutter/material.dart';

class SpendingHistory extends StatelessWidget {
  final List<Spend>? spends;

  const SpendingHistory({Key? key, required this.spends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(child: _renderSection());
  }

  Widget _renderSpend(Spend spend) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  spend.getSpendIcon(),
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  spend.getSpendTypeName(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'R\$${spend.price}',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF898989),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Ontem',
                      style: TextStyle(fontSize: 16, color: Color(0xFF898989)),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 28),
                Text(
                  spend.company,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF898989),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const DefaultApproachHeader(
        title: "Histórico de Gastos",
        titleFontSize: 22,
        description: " ",
      ),
      RoundedTextField(
        label: "Buscar",
        controller: TextEditingController(),
        icon: Icons.search,
        onChanged: (text) {},
        validator: (text) => null,
        margin: const EdgeInsets.only(right: 75),
      ),
      const SizedBox(height: 25),
      if (spends != null)
        Column(
          children: spends!.map((spend) => _renderSpend(spend)).toList(),
        )
    ]);
  }
}
