import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/company_card.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/product_card.dart';
import 'package:apollo/widgets/containers/tag.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:apollo/widgets/elements/tad_button.dart';
import 'package:flutter/material.dart';

class MyProducts extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();

  final List<Product> products;

  MyProducts({Key? key, required this.products}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  Widget _renderCompanies() {
    return widget.products.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: widget.products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductCard(
                product: widget.products[index],
                onTap: () => {},
              );
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.production_quantity_limits,
                textSize: 14,
                text: "Você não tem nenhum produto :("));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Row(
              children: [
                const Text(
                  'Seus produtos',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                TADButton(
                  onPressed: () {
                    RouteUtils.showModal(context, route: 'create_product');
                  },
                )
              ],
            ),
          ),
        ),
        Flexible(child: _renderCompanies()),
      ],
    );
  }
}
