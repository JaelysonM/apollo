import 'package:apollo/modals/login/generic_login_step.dart';
import 'package:apollo/utils/string_utils.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
        }),
        const GenericLoginStep('Sua senha', 'password',
            type: TextInputType.visiblePassword),
      ],
      onSubmit: (values) => {},
      successWidget: Container(),
      errorWidget: Container(),
    );
  }
}
