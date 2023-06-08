import 'package:apollo/models/subscription_plan.dart';

class PlanDto {
  final String? id;
  final String name;
  final double price;
  final double interval;
  final RecurrenceRule recurrenceRule;

  PlanDto({
    this.id,
    required this.name,
    required this.price,
    required this.interval,
    required this.recurrenceRule,
  });

  factory PlanDto.fromJson(Map<String, dynamic> json) => PlanDto(
        id: json['id'],
        name: json["name"],
        price: json["price"],
        interval: json["interval"],
        recurrenceRule: RecurrenceRule.values
            .firstWhere((element) => element.name == json["recurrenceRule"]),
      );
}
