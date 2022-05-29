import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
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
      id: '2',
      name: 'Clínica OdontoMais',
      email: 'clinic.odontomais@gmail.com',
      availableSchedules: 0,
      meanTime: 30,
      evaluation: 4.56,
      imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
  CompanyAccount(
      id: '2',
      name: 'Clínica OdontoMais',
      email: 'clinic.odontomais@gmail.com',
      availableSchedules: 0,
      meanTime: 30,
      evaluation: 4.56,
      imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
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

Account GLOBAL_ACCOUNT = UserAccount(
    id: '1',
    firstName: 'Jaelyson',
    email: 'jaelysonmartins@gmail.com',
    lastName: 'Martins',
    evaluation: 4.45,
    punctuality: 45);

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
