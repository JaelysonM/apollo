import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/company_info.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/company_avatar.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  final CompanyAccount company;
  final Function? onTap;
  const CompanyCard({Key? key, required this.company, this.onTap})
      : super(key: key);

  Widget _renderCardHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CompanyAvatar(company: company),
            const SizedBox(
              width: 8,
            ),
            Text(
              company.name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        CompanyInfo(
          company: company,
        )
      ],
    );
  }

  Widget _renderAvailableSchedules() {
    if (company.availableSchedules! >= 1) {
      return MixedText(
        [
          TextSpan(
              text:
                  '${company.availableSchedules} ${company.availableSchedules == 1 ? 'horário' : 'horários'}'),
          TextSpan(
              text: (company.availableSchedules == 1)
                  ? ' disponível'
                  : ' disponíveis',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: ' para hoje'),
        ],
        size: 12,
      );
    } else {
      return const MixedText(
        [
          TextSpan(text: 'Sem horários'),
          TextSpan(
              text: ' disponíveis',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' para hoje!'),
        ],
        size: 12,
      );
    }
  }

  Widget _renderCardBody() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const CircleIconButton(
              icon: Icons.add_task,
              size: 25,
              padding: 10,
              buttonColor: kFastScheduleColor),
          const SizedBox(width: 12),
          Expanded(
            child: _renderAvailableSchedules(),
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
                    children: [_renderCardHeader(), _renderCardBody()],
                  )),
            )));
  }
}
