import 'package:apollo/modals/products/delete_product.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/mean_time.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool creatorVision;
  final Function? onTap;
  final Function? onTapEdit;
  final Function? onTapDelete;
  const ProductCard(
      {Key? key,
      required this.product,
      this.onTap,
      this.creatorVision = true,
      this.onTapEdit,
      this.onTapDelete})
      : super(key: key);

  Widget _renderCardHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(
            product.name,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto Condensed',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          const SizedBox(width: 5),
          MeanTime(
            meanTime: product.meanTime,
            fontSize: 12,
          )
        ]),
        creatorVision
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TouchableOpacity(
                    onTap: () {
                      if (onTapDelete != null) onTapDelete!();
                    },
                    child: const Icon(
                      Icons.horizontal_rule,
                      color: kErrorRed,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  TouchableOpacity(
                    onTap: () {
                      if (onTapEdit != null) onTapEdit!();
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }

  Widget _renderCardBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MixedText([
            TextSpan(text: '6 agendamentos'),
            TextSpan(
                text: ' feitos ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'para esse produto'),
          ], size: 12, color: Colors.white),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: MixedText([
              TextSpan(
                text: product.price.toStringAsFixed(2).split('.')[0],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ".${product.price.toStringAsFixed(2).split('.')[1]}",
                style: const TextStyle(),
              ),
            ], size: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap?.call(),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            child: DottedBorder(
              strokeWidth: 0.5,
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: const Radius.circular(25),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                  child: Column(
                    children: [_renderCardHeader(context), _renderCardBody()],
                  )),
            )));
  }
}
