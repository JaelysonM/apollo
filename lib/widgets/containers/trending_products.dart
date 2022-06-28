import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/widgets/containers/trending_product_card.dart';
import 'package:apollo/widgets/styles/small_section_title.dart';
import 'package:flutter/material.dart';

class TrendingProducts extends StatelessWidget {
  final CompanyAccount company;
  const TrendingProducts({Key? key, required this.company}) : super(key: key);

  Widget _renderHorizontalView(List<Product> trendingProducts) {
    return ListView.builder(
        itemCount: trendingProducts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              TrendingProductCard(product: trendingProducts[index]),
              const SizedBox(
                width: 20,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> trendingProducts = [];
    return trendingProducts.isEmpty
        ? Container()
        : Column(
            children: [
              const SmallSectionTitle('Em alta'),
              Padding(
                padding: const EdgeInsets.only(left: 19, top: 15),
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 65),
                    child: _renderHorizontalView(trendingProducts)),
              )
            ],
          );
  }
}
