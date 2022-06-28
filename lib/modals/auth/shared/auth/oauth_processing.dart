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
      await auth.loginWithProvider(widget.authProvider, widget.company);
      setState(() {
        loaded = true;
        loading = false;
        account = auth.account;
      });
    } catch (e) {
      setState(() {
        loaded = true;
        loading = false;
        error = e.toString();
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
