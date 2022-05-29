import 'package:apollo/constants/colors.dart';
import 'package:apollo/dtos/login_dto.dart';
import 'package:apollo/modals/login/login_succes.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/models/user_account.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginProcessing extends StatefulWidget {
  final LoginDto loginDto;
  const LoginProcessing({Key? key, required this.loginDto}) : super(key: key);

  @override
  State<LoginProcessing> createState() => _LoginProcessingState();
}

class _LoginProcessingState extends State<LoginProcessing> {
  late bool loading = true;
  late String? error;
  late Account? account;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
        account = UserAccount(
            id: '1',
            email: 'jaelysonmartins@gmail.com',
            firstName: 'Jaelyson',
            lastName: 'Martins');
      });
    });
  }

  void _cleanFormHistory(BuildContext context) {
    FormWithStepContentState? formWithStepContentState =
        FormWithStepContent.useFormWithStep(context);
    if (formWithStepContentState != null) {
      formWithStepContentState.clean();
    }
  }

  Widget _renderResult() {
    if (loading) {
      return Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: kSystemLightPurple,
              size: 50,
            ),
          ));
    } else {
      return LoginSuccess(account: account!);
    }
  }

  @override
  Widget build(BuildContext context) {
    _cleanFormHistory(context);
    return DefaultModalContainer(child: _renderResult());
  }
}
