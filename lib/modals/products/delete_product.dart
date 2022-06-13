import 'package:apollo/models/product.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
  final Product product;
  const DeleteProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultApproachHeader(
                      title: "Apagar produto",
                      descriptionFontSize: 18,
                      description: [
                        const TextSpan(text: 'Deseja apagar o produto'),
                        TextSpan(
                            text: ' ${product.name}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(
                          text: '?',
                        ),
                      ]),
                  const SizedBox(height: 15),
                  DefaultButton(
                    child:
                        const LargeTextHeader(content: "Apagar", fontSize: 18),
                    backgroundColor: kSystemPurple,
                    onPressed: () {},
                  )
                ])));
  }
}
