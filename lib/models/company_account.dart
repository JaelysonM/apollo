import 'package:apollo/models/account.dart';

class CompanyAccount extends Account {
  int availableSchedules;
  int meanTime;
  String imageURL;

  CompanyAccount({
    required String id,
    required String name,
    required String email,
    required this.imageURL,
    double evaluation = 5.0,
    bool isActive = false,
    this.availableSchedules = 0,
    this.meanTime = 65,
    bool isAdmin = false,
  }) : super(
          id: id,
          name: name,
          email: email,
          evaluation: evaluation,
          isActive: isActive,
          isAdmin: isAdmin,
        );
}
