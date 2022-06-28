import 'package:apollo/dtos/product_dto.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/my_products.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:apollo/widgets/form/range_slider_input.dart';
import 'package:apollo/widgets/form/slider_input.dart';
import 'package:apollo/widgets/form/submit_botton.dart';
import 'package:apollo/widgets/form/text_input.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

import 'product_processing.dart';

class EditProduct extends StatelessWidget {
  final MyProductsState? myProductsState;
  final Product product;

  const EditProduct({Key? key, this.myProductsState, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: CustomForm(
          initialValues: {
            'name': product.name,
            'price': product.price,
            'duration': product.duration.map((e) => e.toDouble()).toList(),
          },
          onSubmit: (form) {
            RouteUtils.showOrPushModal(context,
                cleanAll: true,
                modalContent: ProductProcessing(
                  myProductsState: myProductsState,
                  action: ProductAction.edit,
                  productDto: ProductDto.fromJson({
                    ...form,
                    'id': product.documentId(),
                  }),
                ));
          },
          name: 'create_product',
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const DefaultApproachHeader(
                title: "Touch-And-Deploy",
                titleFontSize: 30,
                description:
                    "É rápido e fácil! Coloque um nome para um produto, o tempo de demanda e o seu preço.",
              ),
              const SizedBox(height: 20),
              TextInput(
                name: 'name',
                labelFontSize: 16,
                label: 'Nome do produto',
                theme: TextInputTheme.rounded,
              ),
              const SizedBox(height: 10),
              const SliderInput(
                  label: "Preço: R\$%1\$", name: 'price', max: 200, min: 0),
              const RangeSliderInput(
                  label: "De %1\$h à %2\$h",
                  name: 'duration',
                  divisions: 120,
                  max: 24,
                  min: 0),
              const SizedBox(height: 9),
              const SubmitButton(
                  child: LargeTextHeader(content: "Deploy!", fontSize: 18))
            ]),
          ]),
    );
  }
}
