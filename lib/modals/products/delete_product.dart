import 'package:apollo/constants/colors.dart';
import 'package:apollo/models/product.dart';
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
        child: Column(children: [
      DefaultApproachHeader(
        title: "Apagar produto",
        description: "Deseja apagar o produto ${product.name}?",
      ),
      const SizedBox(height: 15),
      DefaultButton(
        child: const LargeTextHeader(content: "Apagar", fontSize: 18),
        backgroundColor: kSystemLightPurple,
        onPressed: () {},
      )
    ]));
  }
}
