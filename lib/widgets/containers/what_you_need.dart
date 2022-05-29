import 'package:apollo/constants/colors.dart';
import 'package:apollo/utils/route_utils.dart';
import 'package:apollo/widgets/containers/dotted_card_tiny.dart';
import 'package:apollo/widgets/containers/touchable_icon_left_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class WhatYouNeed extends StatelessWidget {
  const WhatYouNeed({Key? key}) : super(key: key);

  Widget _renderOrSeparator() => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: const Text(
          'ou',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
  Widget _renderCardSeparator() => const SizedBox(width: 20);
  Widget _renderHorizontalListView() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 59),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _renderCardSeparator(),
          TouchableIconLeftCard(
            child: const Text(
              'Marcar um serviço',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: (BuildContext context) {
              RouteUtils.showModal(
                context,
                route: 'identify_approach',
              );
            },
            icon: const Icon(
              Icons.watch_later_outlined,
              color: Colors.white,
            ),
            backgroundColor: kSystemLightBlue2,
          ),
          _renderCardSeparator(),
          const TouchableIconLeftCard(
            child: Text(
              'Acelerar meu negócio',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            icon: Icon(
              Icons.donut_large,
              color: Colors.white,
            ),
            backgroundColor: kSystemDarkBlue2,
          ),
          _renderOrSeparator(),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              constraints: BoxConstraints(maxWidth: 100),
              child: DottedBorder(
                child: Container(
                    child: const Text('Tô so dando uma olhadinha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        )),
                    padding: const EdgeInsets.all(8)),
                strokeWidth: 0.5,
                borderType: BorderType.RRect,
                color: Colors.white,
                radius: const Radius.circular(20),
              )),
          _renderCardSeparator(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19),
            child: Text(
              'Do que você precisa?',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        _renderHorizontalListView()
      ],
    );
  }
}
