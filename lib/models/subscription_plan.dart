import 'package:apollo/models/company_account.dart';

enum RecurrenceRule {
  daily,
  weekly,
  monthly,
  yearly,
}

class SubscriptionPlan {
  final String name;
  final String? description;
  final double price;
  final int interval;
  final RecurrenceRule recurrenceRule;
  final CompanyAccount company;

  SubscriptionPlan({
    required this.name,
    required this.price,
    this.interval = 7,
    this.description,
    this.recurrenceRule = RecurrenceRule.daily,
    required this.company,
  });

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
}



// import 'package:apollo/models/company_account.dart';
// import 'package:apollo/shared/base_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product extends BaseModel {
//   late String _documentId;

//   late CompanyAccount _company;

//   late String companyId;
//   late String name;
//   late String description;
//   late double price;
//   late List<dynamic> duration;

//   Timestamp createdAt = Timestamp.now();

//   Product.fromMap(DocumentSnapshot document) : super.fromMap(document) {
//     setDocumentId(document.id);
//     companyId = document.get('companyId');
//     name = document.get('name');
//     description = document.get('description');
//     price = document.get('price');
//     duration = document.get('duration');
//     createdAt = document.get('createdAt');
//   }

//   Product.create(Map<String, dynamic> map) : super.create(map) {
//     name = map['name'];
//     description = map['description'] ?? '';
//     price = map['price'];
//     duration = map['duration'];
//     companyId = map['companyId'];
//   }

//   @override
//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{};
//     map['name'] = name;
//     map['description'] = description;
//     map['price'] = price;
//     map['duration'] = duration;
//     map['createdAt'] = createdAt;
//     map['companyId'] = companyId;

//     return map;
//   }

//   @override
//   String documentId() {
//     return _documentId;
//   }

//   String setDocumentId(String id) {
//     return _documentId = id;
//   }

//   @override
//   CompanyAccount company() {
//     return _company;
//   }

//   CompanyAccount setCompany(CompanyAccount company) {
//     return _company = company;
//   }

//   // Calc mean time
//   int get meanTime => duration.reduce((a, b) => a + b * 60) ~/ duration.length;
// }
