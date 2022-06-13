import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel {
  BaseModel.fromMap(DocumentSnapshot document);
  BaseModel.create(Map<String, dynamic> map);
  toMap();
  String documentId();
}
