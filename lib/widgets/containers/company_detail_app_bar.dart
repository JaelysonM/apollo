import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/company_info.dart';
import 'package:apollo/widgets/containers/evaluation.dart';
import 'package:apollo/widgets/elements/back_button.dart';
import 'package:apollo/widgets/elements/company_avatar.dart';
import 'package:flutter/material.dart';

class CompanyDetailAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final CompanyAccount company;

  CompanyDetailAppBar({required this.expandedHeight, required this.company});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: kThemeBackground,
          ),
          child: const DefaultBackButton(),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CompanyAvatar(
                  company: company,
                  size: 14,
                ),
                const SizedBox(width: 10),
                Text(
                  company.name,
                  style: TextStyle(
                      fontSize: 14 * (shrinkOffset / expandedHeight),
                      fontWeight: FontWeight.bold,
                      color: kSecondaryLightGray),
                ),
                const SizedBox(width: 10),
                Evaluation(
                    evaluation: company.evaluation,
                    fontSize: 13 * (shrinkOffset / expandedHeight)),
              ]),
        ),
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CompanyAvatar(
                        company: company,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            company.name,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryLightGray),
                          ),
                          const SizedBox(height: 5),
                          CompanyInfo(company: company, fontSize: 12),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    iconSize: 30,
                    color: kSecondaryLightGray,
                    onPressed: () {},
                  ),
                ],
              )),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
