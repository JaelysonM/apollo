import 'package:apollo/models/account.dart';
import 'package:apollo/models/product.dart';
import 'package:flutter/material.dart';

enum ScheduleStatus {
  created,
  confirmed,
  canceled,
  finished,
}

String getScheduleStatusLabel(ScheduleStatus status) {
  switch (status) {
    case ScheduleStatus.created:
      return 'Criado';
    case ScheduleStatus.confirmed:
      return 'Confirmado';
    case ScheduleStatus.canceled:
      return 'Cancelado';
    case ScheduleStatus.finished:
      return 'Finalizado';
  }
}

Color getColorFromScheduleStatus(ScheduleStatus status) {
  switch (status) {
    case ScheduleStatus.created:
      return Colors.red;
    case ScheduleStatus.confirmed:
      return Colors.orange;
    case ScheduleStatus.canceled:
      return Colors.grey;
    case ScheduleStatus.finished:
      return Colors.green;
  }
}

class Schedule {
  final String id;
  final Product product;
  final Account client;

  final DateTime? createdAt;
  final DateTime? finishedAt;
  final DateTime? cancelledAt;
  final DateTime? confirmedAt;

  final ScheduleStatus status;

  Schedule({
    required this.id,
    required this.product,
    required this.client,
    this.createdAt,
    this.finishedAt,
    this.cancelledAt,
    this.confirmedAt,
    this.status = ScheduleStatus.created,
  });
}
