import 'package:apollo/modals/auth/shared/login/login_error.dart';
import 'package:apollo/modals/auth/shared/login/login_success.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

enum OAuthProviderType {
  google,
  facebook,
}

class OAuthProcessing extends StatefulWidget {
  final OAuthProviderType authProvider;
  final bool company;
  const OAuthProcessing(
      {Key? key, required this.authProvider, this.company = false})
      : super(key: key);

  @override
  State<OAuthProcessing> createState() => _LoginProcessingState();
}

class _LoginProcessingState extends State<OAuthProcessing> {
  late bool loading = true;
  late bool loaded = false;
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
    if (!loaded) {
      login();
    }
  }

  Widget _renderResult() {
    if (loading) {
      return const Padding(padding: EdgeInsets.all(25), child: FetchLoading());
    } else {
      if (error == null && account != null) {
        return LoginSuccess(account: account!);
      } else {
        return LoginError(error: error ?? 'Erro inesperado');
      }
    }
  }

  login() async {
    AuthService auth = Provider.of<AuthService>(context);
    try {
      await auth.loginWithProvider(widget.authProvider, widget.company);
      setState(() {
        loading = false;
        account = auth.account;
      });
    } on AuthException catch (ex) {
      setState(() {
        loading = false;
        error = ex.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(child: _renderResult());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
