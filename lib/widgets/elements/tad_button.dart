import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:flutter/material.dart';

class TADButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const TADButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed?.call();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: kFastScheduleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 5, vertical: 7), // and this
          child: Row(
            children: const [
              DefaultBoldText(
                content: "Touch-and-deploy",
                fontSize: 14,
              ),
              SizedBox(width: 5),
              Icon(
                Icons.call_made,
                size: 14,
              )
            ],
          )),
    );
  }
}
