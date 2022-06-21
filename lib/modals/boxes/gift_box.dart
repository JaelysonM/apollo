import 'package:flutter/material.dart';

class GiftBox extends StatefulWidget {
  const GiftBox({Key? key}) : super(key: key);

  @override
  State<GiftBox> createState() => _GiftBoxState();
}

class _GiftBoxState extends State<GiftBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          'Abrir Box',
          style: TextStyle(color: Colors.white, fontSize: 40),
        )
      ]),
    );
  }
}
