import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/models/schedule.dart';
import 'package:apollo/models/spend.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/models/user_account.dart';
import 'package:flutter/material.dart';

List<String> DAYS_ARRAY = [
  'segunda-feira',
  'terça-feira',
  'quarta-feira',
  'quinta-feira',
  'sexta-feira',
  'sábado',
  'domingo',
];

List<String> MONTHS_ARRAY = [
  'janeiro',
  'fevereiro',
  'março',
  'abril',
  'maio',
  'junho',
  'julho',
  'agosto',
  'setembro',
  'outubro',
  'novembro',
  'dezembro'
];

List<String> COMPANY_TAGS = ['Barbearias', 'Estética', 'Serviços', 'Consultas'];

List<CompanyAccount> COMPANIES_MOCK = [
  CompanyAccount(
      id: '1',
      name: 'Barbearia Dom Castro',
      email: 'barb.domcastro@gmail.com',
      availableSchedules: 5,
      imageURL: 'https://i.imgur.com/kfWPor0.png'),
  CompanyAccount(
      id: '2',
      name: 'Clínica OdontoMais',
      email: 'clinic.odontomais@gmail.com',
      availableSchedules: 0,
      meanTime: 30,
      evaluation: 4.56,
      imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
  CompanyAccount(
      id: '3',
      name: 'Clínica OdontoMais',
      email: 'clinic.odontomais@gmail.com',
      availableSchedules: 0,
      meanTime: 120,
      evaluation: 4.99,
      imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
  CompanyAccount(
      id: '4',
      name: 'Clínica OdontoMais',
      email: 'clinic.odontomais@gmail.com',
      availableSchedules: 0,
      meanTime: 30,
      evaluation: 4.56,
      imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
];

List<SubscriptionPlan> SUBSCRIPTION_PLANS_MOCK = [
  SubscriptionPlan(
    name: 'Mensal',
    price: 99.99,
    interval: 1,
    recurrenceRule: RecurrenceRule.monthly,
    company: COMPANIES_MOCK[3],
  ),
  SubscriptionPlan(
    name: 'Trimestral',
    price: 199.99,
    interval: 3,
    recurrenceRule: RecurrenceRule.monthly,
    company: COMPANIES_MOCK[0],
  ),
  SubscriptionPlan(
    name: 'Semestral',
    price: 299.99,
    interval: 6,
    recurrenceRule: RecurrenceRule.monthly,
    company: COMPANIES_MOCK[0],
  ),
  SubscriptionPlan(
    name: 'Anual',
    price: 399.99,
    interval: 12,
    recurrenceRule: RecurrenceRule.monthly,
    company: COMPANIES_MOCK[0],
  ),
];

List<Spend> SPENDING_HISTORY_MOCK = [
  Spend(
    id: '1',
    price: 99.99,
    createdAt: DateTime.now(),
    company: COMPANIES_MOCK[0],
    type: SpendType.PAYMENT,
    owner: GLOBAL_ACCOUNT,
  ),
  Spend(
    id: '1',
    price: 99.99,
    createdAt: DateTime.now(),
    company: COMPANIES_MOCK[0],
    type: SpendType.PAYMENT,
    owner: GLOBAL_ACCOUNT,
  ),
  Spend(
    id: '1',
    price: 99.99,
    createdAt: DateTime.now(),
    company: COMPANIES_MOCK[0],
    type: SpendType.REVOKE,
    owner: GLOBAL_ACCOUNT,
  ),
  Spend(
    id: '1',
    price: 99.99,
    createdAt: DateTime.now(),
    company: COMPANIES_MOCK[0],
    type: SpendType.PAYMENT,
    owner: GLOBAL_ACCOUNT,
  ),
];

Account GLOBAL_ACCOUNT = UserAccount(
    id: '1',
    firstName: 'Jaelyson',
    email: 'jaelysonmartins@gmail.com',
    lastName: 'Martins',
    evaluation: 4.55,
    punctuality: 23,
    isApollo: true);

List<Product> PRODUCTS_MOCK = [
  Product(
    id: '1',
    name: 'Corte de cabelo',
    description: 'Corte de cabelo com barba e bigode',
    price: 50.0,
    duration: 30,
    company: COMPANIES_MOCK[0],
  ),
  Product(
    id: '2',
    name: 'Corte de cabelo',
    description: 'Corte de cabelo com barba e bigode',
    price: 50.0,
    duration: 30,
    company: COMPANIES_MOCK[0],
  )
];

List<Schedule> SCHEDULES_MOCK = [
  Schedule(
    id: '1',
    product: PRODUCTS_MOCK[0],
    client: GLOBAL_ACCOUNT,
    createdAt: DateTime.now().subtract(Duration(days: 1)),
    status: ScheduleStatus.created,
  ),
  Schedule(
    id: '2',
    product: PRODUCTS_MOCK[1],
    client: GLOBAL_ACCOUNT,
    createdAt: DateTime.now().subtract(Duration(days: 2)),
    status: ScheduleStatus.created,
  ),
  Schedule(
    id: '3',
    product: PRODUCTS_MOCK[0],
    client: GLOBAL_ACCOUNT,
    createdAt: DateTime.now().subtract(Duration(days: 3)),
    status: ScheduleStatus.created,
  ),
  Schedule(
    id: '4',
    product: PRODUCTS_MOCK[1],
    client: GLOBAL_ACCOUNT,
    createdAt: DateTime.now().subtract(Duration(days: 4)),
    status: ScheduleStatus.created,
  ),
  Schedule(
    id: '5',
    product: PRODUCTS_MOCK[0],
    client: GLOBAL_ACCOUNT,
    createdAt: DateTime.now().subtract(Duration(days: 5)),
    status: ScheduleStatus.created,
  )
];

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
