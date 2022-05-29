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
