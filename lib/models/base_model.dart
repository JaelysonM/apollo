import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel {
  BaseModel.fromMap(DocumentSnapshot document);
  toMap();
  String documentId();
}
