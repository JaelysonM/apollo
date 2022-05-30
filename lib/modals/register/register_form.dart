import 'package:apollo/dtos/register_dto.dart';
import 'package:apollo/modals/register/generic_register_step.dart';
import 'package:apollo/modals/register/register_processing.dart';
import 'package:apollo/utils/route_utils.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWithStep(
      name: 'register',
      steps: const [
        GenericRegisterStep(
          'Seu nome',
          'name',
        ),
        GenericRegisterStep('Seu e-mail', 'email',
            type: TextInputType.emailAddress),
        GenericRegisterStep('Sua senha', 'password',
            type: TextInputType.visiblePassword),
        GenericRegisterStep('Confirme sua senha', 'password_confirm',
            equalTo: "password",
            equalToLabel: "senha",
            type: TextInputType.visiblePassword),
      ],
      onSubmit: (values) {
        RouteUtils.showOrPushModal(context,
            cleanAll: true,
            modalContent:
                RegisterProcessing(registerDto: RegisterDto.fromJson(values)));
      },
    );
  }
}
