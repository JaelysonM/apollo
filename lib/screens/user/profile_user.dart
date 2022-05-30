import 'package:apollo/widgets/containers/last_schedules.dart';
import 'package:apollo/widgets/containers/user_geral_section.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LastSchedules(),
        SizedBox(height: 20),
        UserGeralSection()
      ],
    );
  }
}
