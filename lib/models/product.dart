import 'package:apollo/models/company_account.dart';

class Product {
  final String id;
  final CompanyAccount company;
  final String name;
  final int duration;
  final String description;
  final double price;

  const Product(
      {required this.id,
      required this.company,
      required this.duration,
      required this.name,
      required this.description,
      required this.price});
}
