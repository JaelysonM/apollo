import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
import 'package:flutter/material.dart';

class Spend {
  final String id;
  final CompanyAccount company;
  final SpendType type;
  final Account owner;
  final double price;
  final DateTime createdAt;

  const Spend(
      {required this.id,
      required this.owner,
      required this.company,
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
