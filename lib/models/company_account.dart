import 'package:apollo/models/account.dart';
import 'package:apollo/shared/utils/image_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyAccount extends Account {
  late String name;
  late int? availableSchedules;
  late int? meanTime;
  late String? imageURL;
  CompanyAccount.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    name = document.get('name') as String;
    availableSchedules = document.get('available_schedules');
    meanTime = document.get('mean_time');
    imageURL = document.get('image_url');

    setIdentifier(name);
  }

  CompanyAccount.create(String uid, Map<String, dynamic> map)
      : super.create(uid, map) {
    name = map['name'] as String;
    imageURL = map['image_url'];
    availableSchedules = map['available_schedules'] ?? 0;
    meanTime = map['mean_time'] ?? 60;

    setIdentifier(name);
  }

  @override
  toMap() {
    var map = super.toMap();
    map['name'] = name;
    map['available_schedules'] = availableSchedules;
    map['mean_time'] = meanTime;
    map['image_url'] = imageURL;

    return map;
  }
}
