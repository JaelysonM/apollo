import 'package:apollo/models/spend.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:flutter/material.dart';

class SpendingHistory extends StatelessWidget {
  final List<Spend> spends;

  const SpendingHistory({Key? key, required this.spends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSpend(Spend spend) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
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
                SizedBox(
                  width: 5,
                ),
                Text(
                  spend.getSpendTypeName(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'R\$${spend.price}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF898989),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Ontem',
                      style: TextStyle(fontSize: 16, color: Color(0xFF898989)),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 28),
                Text(
                  spend.company,
                  style: TextStyle(
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
      DefaultApproachHeader(
        title: "Histórico de Gastos",
        titleFontSize: 22,
        description: " ",
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(90)),
        margin: const EdgeInsets.only(right: 50),
        child: TextField(
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF898989),
              size: 30,
            ),
            labelText: 'Buscar',
            labelStyle: TextStyle(color: Color(0xFF898989), fontSize: 18),
          ),
        ),
      ),
      SizedBox(height: 25),
      Column(
        children: spends.map((spend) => _renderSpend(spend)).toList(),
      )
    ]);
  }
}
