import 'package:apollo/constants/colors.dart';
import 'package:apollo/utils/route_utils.dart';
import 'package:apollo/widgets/containers/touchable_icon_left_card.dart';
import 'package:flutter/material.dart';

class WhatYouNeed extends StatelessWidget {
  const WhatYouNeed({Key? key}) : super(key: key);

  Widget _renderHorizontalListView() {
    return Container(
      constraints: BoxConstraints(maxHeight: 60),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TouchableIconLeftCard(
            child: const Text(
              'Marcar um serviço',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onTap: (BuildContext context) {
              RouteUtils.popupIdentifyModal(context);
            },
            icon: const Icon(
              Icons.watch_later_outlined,
              color: Colors.white,
            ),
            backgroundColor: kSystemLightBlue2,
          ),
          TouchableIconLeftCard(
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