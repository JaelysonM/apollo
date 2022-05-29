import 'package:apollo/constants/colors.dart';
import 'package:apollo/dtos/register_dto.dart';
import 'package:apollo/modals/register/register_success.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/models/user_account.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterProcessing extends StatefulWidget {
  final RegisterDto registerDto;
  const RegisterProcessing({Key? key, required this.registerDto})
      : super(key: key);

  @override
  State<RegisterProcessing> createState() => _RegisterProcessingState();
}

class _RegisterProcessingState extends State<RegisterProcessing> {
  late bool loading = true;
  late String? error;
  late Account? account;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 7), () {
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
      return RegisterSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    _cleanFormHistory(context);
    return DefaultModalContainer(child: _renderResult());
  }
}
