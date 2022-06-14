import 'package:apollo/shared/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Account extends BaseModel {
  late String _documentId;

  late String _name;

  late String email;
  late String uid;

  late double evaluation = 5.0;
  late double lastEvaluation = 5.0;

  late double punctuality = 100;
  late double lastPunctuality = 100;
  late bool isActive = false;
  late bool isAdmin = false;

  Timestamp createdAt = Timestamp.now();

  Account.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    setDocumentId(document.id);

    email = document.get('email');
    uid = document.get('uid');
    evaluation = document.get('evaluation');
    lastEvaluation = document.get('last_evaluation');
    punctuality = document.get('punctuality');
    lastPunctuality = document.get('last_punctuality');
    isActive = document.get('is_active');
    isAdmin = document.get('is_admin');
    createdAt = document.get('created_at');
  }

  Account.create(this.uid, Map<String, dynamic> map) : super.create(map) {
    email = map['email'] as String;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['email'] = email;
    map['uid'] = uid;
    map['evaluation'] = evaluation;
    map['last_evaluation'] = lastEvaluation;
    map['punctuality'] = punctuality;
    map['last_punctuality'] = punctuality;
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

  String getPresentation() {
    return _name.split(' ').length > 1 ? _name.split(' ').first : _name;
  }

  String setDocumentId(String id) {
    return _documentId = id;
  }

  String setIdentifier(String name) {
    return _name = name;
  }
}
