import 'package:apollo/models/account.dart';

class UserAccount extends Account {
  String firstName;
  String lastName;
  String? phone;
  bool? isApollo;

  UserAccount(
      {required String id,
      required String name,
      required String email,
      required this.firstName,
      required this.lastName,
      this.phone,
      double evaluation = 5.0,
      bool isActive = false,
      bool isAdmin = false,
      bool isApollo = false})
      : super(
          id: id,
          name: name,
          email: email,
          evaluation: evaluation,
          isActive: isActive,
          isAdmin: isAdmin,
        );
}
