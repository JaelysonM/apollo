import 'package:apollo/constants/globals.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/models/schedule.dart';
import 'package:apollo/models/spend.dart';

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
      this.isApollo = false})
      : super(
          id: id,
          name: firstName + " " + lastName,
          email: email,
          evaluation: evaluation,
          isActive: isActive,
          punctuality: punctuality,
          isAdmin: isAdmin,
        );
  List<Schedule> getSchedules() {
    return SCHEDULES_MOCK
        .where(
            (schedule) => schedule.client == this && schedule.createdAt != null)
        .toList();
  }

  List<Schedule> getLastSchedules({limit = 5}) {
    List<Schedule> schedules = getSchedules();
    schedules.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    return schedules.sublist(
        0, limit > schedules.length ? schedules.length : limit);
  }

  List<Spend> getSpends() {
    return SPENDING_HISTORY_MOCK.where((spend) => spend.owner == this).toList();
  }
}
