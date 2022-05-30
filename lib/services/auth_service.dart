import 'package:apollo/dtos/login_dto.dart';
import 'package:apollo/dtos/register_dto.dart';
import 'package:apollo/modals/auth/oauth_processing.dart';
import 'package:apollo/models/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      this.user = user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  verifyEmailAvailability(String email) async {
    var methods = await _auth.fetchSignInMethodsForEmail(email);
    return methods.isEmpty;
  }

  register(RegisterDto registerDto) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: registerDto.email, password: registerDto.password);
      _getUser();
      return Account(
        email: registerDto.email,
        id: '1',
        name: registerDto.first_name + ' ' + registerDto.last_name,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha criada é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  loginWithProvider(OAuthProviderType authProvider) async {
    await _loginWithGoogle();
  }

  _loginWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw AuthException('Não foi possível realizar o login');
    }

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    _getUser();
  }

  login(LoginDto loginDto) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: loginDto.email, password: loginDto.password);
      _getUser();
      return Account(
        email: loginDto.email,
        id: '1',
        name: 'Jaelyson Martins',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha criada é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw AuthException('Usuário ou senha incorretos');
      }
    }
  }

  logout() {
    _auth.signOut();
    _getUser();
  }
}
