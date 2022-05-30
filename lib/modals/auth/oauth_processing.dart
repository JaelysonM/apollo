import 'package:apollo/constants/colors.dart';
import 'package:apollo/modals/login/login_success.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

enum OAuthProviderType {
  google,
  facebook,
}

class OAuthProcessing extends StatefulWidget {
  final OAuthProviderType authProvider;
  const OAuthProcessing({Key? key, required this.authProvider})
      : super(key: key);

  @override
  State<OAuthProcessing> createState() => _LoginProcessingState();
}

class _LoginProcessingState extends State<OAuthProcessing> {
  late bool loading = true;
  late String? error;
  late Account? account;

  @override
  void initState() {
    super.initState();
    error = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    login();
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
      if (error == null) {
        return LoginSuccess(account: account!);
      } else {
        return Align(
          alignment: Alignment.center,
          child: Text(error!),
        );
      }
    }
  }

  login() async {
    AuthService auth = Provider.of<AuthService>(context);
    try {
      await auth.loginWithProvider(widget.authProvider);
    } catch (e) {
      setState(() {
        loading = false;
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _cleanFormHistory(context);

    return DefaultModalContainer(child: _renderResult());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
