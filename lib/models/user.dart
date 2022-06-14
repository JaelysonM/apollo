import 'package:apollo/models/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends Account {
  late String firstName;
  late String lastName;
  late String? phone;
  late bool isApollo = false;

  User.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    firstName = document.get('first_name') as String;
    lastName = document.get('last_name') as String;
    phone = document.get('phone') as String?;
    isApollo = document.get('is_apollo') as bool;
    setIdentifier(firstName + ' ' + lastName);
  }

  User.create(String uid, Map<String, dynamic> map) : super.create(uid, map) {
    firstName = map['first_name'] as String;
    lastName = map['last_name'] as String;
    phone = null;

    setIdentifier(firstName + ' ' + lastName);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['is_apollo'] = isApollo;
    return map;
  }
}
