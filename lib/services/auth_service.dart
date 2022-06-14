import 'package:apollo/dtos/login_dto.dart';
import 'package:apollo/dtos/register_dto.dart';
import 'package:apollo/modals/auth/shared/auth/oauth_processing.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
import 'package:apollo/repositories/company_repository.dart';
import 'package:apollo/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:apollo/models/user.dart' as userModel;

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository userRepository = UserRepository();
  final CompanyRepository companyRepository = CompanyRepository();

  User? user;
  Account? account;
  bool isLoading = true;
  bool isCompany = false;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) async {
      this.user = user;
      await _getAccount();
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() async {
    user = _auth.currentUser;
  }

  _getAccount() async {
    if (user != null) {
      isCompany = await companyRepository.isCompany(user!.uid);
      account ??= isCompany
          ? await companyRepository.findByUid(user!.uid)
          : await userRepository.findByUid(user!.uid);
    }
  }

  verifyEmailAvailability(String email) async {
    var methods = await _auth.fetchSignInMethodsForEmail(email);
    return methods.isEmpty;
  }

  register(RegisterDto registerDto) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: registerDto.email, password: registerDto.password);
      account = await _createAccount(userCredential, registerDto);
      isCompany = registerDto.company;
      _getUser();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha criada é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else {
        throw AuthException(e.toString());
      }
    }
  }

  _createAccount(UserCredential userCredential, RegisterDto registerDto) async {
    return registerDto.company
        ? await companyRepository.create(CompanyAccount.create(
            userCredential.user?.uid ?? '',
            {'email': registerDto.email, 'name': registerDto.first_name}))
        : await userRepository
            .create(userModel.User.create(userCredential.user?.uid ?? '', {
            'email': registerDto.email,
            'first_name': registerDto.first_name,
            'last_name': registerDto.last_name,
          }));
  }

  loginWithProvider(OAuthProviderType authProvider, bool company) async {
    await _loginWithGoogle(company);
  }

  _loginWithGoogle(bool company) async {
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
    isCompany = company;
    _getUser();
    _getAccount();
    notifyListeners();
  }

  login(LoginDto loginDto) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: loginDto.email, password: loginDto.password);
      isCompany = loginDto.company;
      _getUser();
      _getAccount();
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
    account = null;
    notifyListeners();
  }
}
