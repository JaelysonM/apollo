import 'package:apollo/models/account.dart';

class UserAccount extends Account {
  String firstName;
  String lastName;
  String? phone;
  bool? isApollo;

  UserAccount(
      {required String id,
      required String email,
      required this.firstName,
      required this.lastName,
      this.phone,
      double evaluation = 5.0,
      double punctuality = 100,
      bool isActive = false,
      bool isAdmin = false,
      bool isApollo = false})
      : super(
          id: id,
          name: firstName + " " + lastName,
          email: email,
          evaluation: evaluation,
          isActive: isActive,
          punctuality: punctuality,
          isAdmin: isAdmin,
        );
}
