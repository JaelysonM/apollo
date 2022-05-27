import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  Catalog({Key? key}) : super(key: key);

  Widget _renderSearchSection() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Row(
          children: [
            Flexible(
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 220),
                    child: RoundedTextField(
                      label: "Do que você precisa?",
                      labelFontSize: 15,
                      labelFontWeight: FontWeight.w400,
                      controller: TextEditingController(),
                      icon: Icons.search,
                      borderRadius: 25,
                      onChanged: (text) {},
                      validator: (text) => null,
                    ))),
            Container(
              width: 50,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19),
            child: Text(
              'Catálogo',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _renderSearchSection()
      ],
    );
  }
}
