import 'package:apollo/models/product.dart';
import 'package:apollo/widgets/containers/mean_time.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class TrendingProductCard extends StatelessWidget {
  final Product product;
  final Function? onTap;
  const TrendingProductCard({Key? key, required this.product, this.onTap})
      : super(key: key);

  Widget _renderCardBottom() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160),
      child: const MixedText([
        TextSpan(text: '6 agendamentos'),
        TextSpan(
            text: ' feitos ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'para esse produto'),
      ], size: 14, color: Colors.white),
    );
  }

  Widget _renderCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              product.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white),
            ),
            const SizedBox(
              width: 20,
            ),
            MeanTime(
              meanTime: product.meanTime,
              fontSize: 13,
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap?.call(),
            child: Container(
                child: DottedBorder(
              strokeWidth: 1,
              dashPattern: const [2],
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: const Radius.circular(25),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _renderCardHeader(),
                      const SizedBox(height: 8),
                      _renderCardBottom()
                    ],
                  )),
            ))));
  }
}
