import 'package:flutter/material.dart';

class Spend {
  final String company;
  final SpendType type;
  final double price;
  final DateTime createdAt;

  const Spend(
      {required this.company,
      required this.type,
      required this.price,
      required this.createdAt});

  IconData getSpendIcon() {
    switch (type) {
      case SpendType.PAYMENT:
        return Icons.monetization_on_outlined;
      case SpendType.REVOKE:
        return Icons.block_rounded;
    }
  }

  String getSpendTypeName() {
    switch (type) {
      case SpendType.PAYMENT:
        return 'Pagamento efetuado';
      case SpendType.REVOKE:
        return 'Cancelamento';
    }
  }
}

enum SpendType { PAYMENT, REVOKE }
