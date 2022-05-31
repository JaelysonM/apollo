import 'package:apollo/models/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Account extends BaseModel {
  late String _documentId;

  late String _name;

  late String email;

  late double evaluation = 5.0;
  late double lastEvaluation = 5.0;

  late double punctuality = 100;
  late bool isActive = false;
  late bool isAdmin = false;

  DateTime createdAt = DateTime.now();

  Account.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    setDocumentId(document.id);

    email = document.get('email') as String;
    evaluation = document.get('evaluation') as double;
    lastEvaluation = document.get('last_evaluation') as double;
    punctuality = document.get('punctuality') as double;
    isActive = document.get('is_active') as bool;
    isAdmin = document.get('is_admin') as bool;
    createdAt = document.get('created_at') as DateTime;
  }

  @override
  toMap() {
    var map = {};
    map['email'] = email;
    map['evaluation'] = evaluation;
    map['last_evaluation'] = lastEvaluation;
    map['punctuality'] = punctuality;
    map['is_active'] = isActive;
    map['is_admin'] = isAdmin;
    map['created_at'] = createdAt;
    return map;
  }

  @override
  String documentId() {
    return _documentId;
  }

  String getIdentifier() {
    return _name;
  }

  String setDocumentId(String id) {
    return _documentId = id;
  }

  String setIdentifier(String name) {
    return _name = name;
  }
}
