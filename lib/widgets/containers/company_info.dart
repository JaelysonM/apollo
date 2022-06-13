import 'package:apollo/models/company_account.dart';
import 'package:apollo/widgets/containers/evaluation.dart';
import 'package:apollo/widgets/containers/mean_distance.dart';
import 'package:apollo/widgets/containers/mean_time.dart';
import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  final double fontSize;
  final CompanyAccount company;

  const CompanyInfo({Key? key, required this.company, this.fontSize = 9})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Evaluation(evaluation: company.evaluation, fontSize: fontSize),
        SizedBox(
          width: fontSize,
        ),
        MeanTime(meanTime: company.meanTime, fontSize: fontSize),
        SizedBox(
          width: fontSize,
        ),
        MeanDistance(fontSize: fontSize, distance: 4.8)
      ],
    );
  }
}
