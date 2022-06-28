import 'package:flutter/material.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      iconSize: 20,
      alignment: Alignment.center,
      color: Colors.white,
      icon: const Icon(Icons.arrow_back_ios_rounded),
      onPressed: () => Navigator.pop(context),
    );
  }
}
