import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/string_utils.dart';
import 'package:apollo/widgets/containers/default_info_card.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/material.dart';

class TotalReturnCard extends StatelessWidget {
  final double total;
  final double percentage;
  const TotalReturnCard(
      {Key? key, required this.total, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultInfoCard(
      maxWidth: 145,
      backgroundColor: kSystemBlue2,
      children: [
        const Text('Retorno\nfinanceiro',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: MixedText([
                TextSpan(
                    text: 'R\$${StringUtils.formatToNumber(total)}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ], size: 18, color: Colors.white),
            ),
            Expanded(
              child: Text("+$percentage%",
                  style: const TextStyle(fontSize: 8, color: kLightGreen)),
            )
          ],
        )
      ],
    );
  }
}
