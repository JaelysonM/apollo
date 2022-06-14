import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';

import 'package:flutter/material.dart';

class RegisterError extends StatelessWidget {
  final String error;
  const RegisterError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: _renderPresentation(context),
    );
  }

  Widget _renderPresentation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DefaultApproachHeader(
            title: 'Oops!', description: 'Algo deu errado, tente novamente.'),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.error_outline_outlined,
            color: kErrorRed,
            size: 22,
          ),
          const SizedBox(width: 5),
          Text(
            error,
            style: const TextStyle(color: kErrorRed, fontSize: 16),
          ),
        ])
      ],
    );
  }
}
