import 'package:apollo/dtos/register_dto.dart';
import 'package:apollo/modals/auth/shared/register/generic_register_step.dart';
import 'package:apollo/modals/auth/shared/register/register_processing.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWithStep(
      name: 'register',
      steps: [
        GenericRegisterStep(
          'O nome da sua empresa',
          'name',
          company: true,
          validator: (value) {
            if (value.length < 5) {
              return 'O nome da sua empresa deve ter mais de 5 caracteres';
            }
          },
        ),
        const GenericRegisterStep(
          'Um e-mail',
          'email',
          type: TextInputType.emailAddress,
          company: true,
        ),
        const GenericRegisterStep(
          'Uma senha',
          'password',
          type: TextInputType.visiblePassword,
          company: true,
        ),
        const GenericRegisterStep(
          'Confirme a senha',
          'password_confirm',
          equalTo: "password",
          equalToLabel: "senha",
          type: TextInputType.visiblePassword,
          company: true,
        ),
      ],
      onSubmit: (values) {
        RouteUtils.showOrPushModal(context,
            cleanAll: true,
            modalContent: RegisterProcessing(
                registerDto: RegisterDto.fromJson(values, true)));
      },
    );
  }
}
