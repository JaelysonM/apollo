import 'package:apollo/dtos/product_dto.dart';
import 'package:apollo/modals/products/product_processing.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/containers/my_products.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
  final Product product;
  final MyProductsState? myProductsState;
  const DeleteProduct({Key? key, required this.product, this.myProductsState})
      : super(key: key);

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
                    onPressed: () {
                      RouteUtils.showOrPushModal(context,
                          cleanAll: true,
                          modalContent: ProductProcessing(
                            myProductsState: myProductsState,
                            action: ProductAction.delete,
                            productDto: ProductDto(
                              id: product.documentId(),
                              name: product.name,
                              price: product.price,
                              duration: product.duration,
                            ),
                          ));
                    },
                  )
                ])));
  }
}
