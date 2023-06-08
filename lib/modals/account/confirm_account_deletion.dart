import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class ConfirmDeletion extends StatelessWidget {
  const ConfirmDeletion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(children: [
            Text(
              "ATENÇÃO!",
              style: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Você está prestes à excluir sua conta",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Você tem certeza disso?",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(children: [
                  DefaultButton(
                      child: const LargeTextHeader(
                          content: "Excluir", fontSize: 18),
                      backgroundColor: Colors.red.shade700,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    width: 6,
                  ),
                  DefaultButton(
                      child: const LargeTextHeader(
                          content: "Cancelar", fontSize: 18),
                      backgroundColor: Color(0xFF6171FF),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ]))
          ]),
        ),
        constraints: const BoxConstraints(
          maxHeight: 200,
        ));
  }
}
