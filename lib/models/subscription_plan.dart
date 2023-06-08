import 'package:apollo/models/company_account.dart';
import 'package:apollo/shared/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum RecurrenceRule {
  daily,
  weekly,
  monthly,
  yearly,
}

class SubscriptionPlan extends BaseModel {
  late String _documentId;

  late CompanyAccount _company;

  late String companyId;
  late String name;
  late String? description;
  late double interval;
  late double price;
  late RecurrenceRule recurrenceRule;

  Timestamp createdAt = Timestamp.now();

  SubscriptionPlan.fromMap(DocumentSnapshot document)
      : super.fromMap(document) {
    setDocumentId(document.id);
    companyId = document.get('companyId');
    name = document.get('name');
    description = document.get('description');
    price = document.get('price');
    recurrenceRule = RecurrenceRule.values.firstWhere(
        (element) => element.name == document.get('recurrenceRule'));
    interval = document.get('interval');
    createdAt = document.get('createdAt');
  }

  SubscriptionPlan.create(Map<String, dynamic> map) : super.create(map) {
    name = map['name'];
    description = map['description'];
    price = map['price'];
    interval = map['interval'];
    companyId = map['companyId'];
    recurrenceRule = RecurrenceRule.values
        .firstWhere((element) => element.name == map['recurrenceRule']);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['interval'] = interval;
    map['recurrenceRule'] = recurrenceRule.name;
    map['createdAt'] = createdAt;
    map['companyId'] = companyId;

    return map;
  }

  @override
  String documentId() {
    return _documentId;
  }

  String setDocumentId(String id) {
    return _documentId = id;
  }

  @override
  CompanyAccount company() {
    return _company;
  }

  CompanyAccount setCompany(CompanyAccount company) {
    return _company = company;
  }

  String getRecurrenceRuleLabel() {
    switch (recurrenceRule) {
      case RecurrenceRule.daily:
        return 'dia';
      case RecurrenceRule.weekly:
        return 'semana';
      case RecurrenceRule.monthly:
        return 'mês';
      case RecurrenceRule.yearly:
        return 'ano';
      default:
        return '...';
    }
  }

  static String getRecurrenceRuleDisplay(String rule) {
    switch (rule) {
      case 'daily':
        return 'Diário';
      case 'weekly':
        return 'Semanal';
      case 'monthly':
        return 'Mensal';
      case 'yearly':
        return 'Anual';
      default:
        return '...';
    }
  }
}
