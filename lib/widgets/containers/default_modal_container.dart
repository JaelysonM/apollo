import 'package:flutter/material.dart';

class DefaultModalContainer extends StatelessWidget {
  final Widget child;
  const DefaultModalContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: child,
    );
  }
}
