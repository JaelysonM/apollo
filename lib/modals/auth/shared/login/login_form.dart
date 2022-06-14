import 'package:apollo/dtos/login_dto.dart';
import 'package:apollo/modals/auth/shared/login/generic_login_step.dart';
import 'package:apollo/modals/auth/shared/login/login_processing.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/shared/utils/string_utils.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final bool company;
  const LoginForm({Key? key, this.company = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWithStep(
      name: 'login',
      steps: [
        GenericLoginStep('Seu email', 'email', type: TextInputType.emailAddress,
            validator: (value) {
          if (!StringUtils.isEmail(value)) {
            return 'Por favor, informe um email válido';
          }
        }, company: company),
        GenericLoginStep('Sua senha', 'password',
            type: TextInputType.visiblePassword, company: company),
      ],
      onSubmit: (values) {
        RouteUtils.showOrPushModal(context,
            cleanAll: true,
            modalContent:
                LoginProcessing(loginDto: LoginDto.fromJson(values, company)));
      },
    );
  }
}
