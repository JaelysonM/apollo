import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FetchLoading extends StatelessWidget {
  const FetchLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: kSystemLightPurple,
        size: 50,
      ),
    );
  }
}
