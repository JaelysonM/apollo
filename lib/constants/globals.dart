import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
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

Account GLOBAL_ACCOUNT = UserAccount(
  id: '1',
  firstName: 'Jaelyson',
  email: 'jaelysonmartins@gmail.com',
  lastName: 'Martins',
  evaluation: 4.55,
  punctuality: 23,
);

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

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
