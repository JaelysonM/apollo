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

// List<CompanyAccount> COMPANIES_MOCK = [
//   CompanyAccount(
//       id: '1',
//       name: 'Barbearia Dom Castro',
//       email: 'barb.domcastro@gmail.com',
//       availableSchedules: 5,
//       imageURL: 'https://i.imgur.com/kfWPor0.png'),
//   CompanyAccount(
//       id: '2',
//       name: 'Clínica OdontoMais',
//       email: 'clinic.odontomais@gmail.com',
//       availableSchedules: 0,
//       meanTime: 30,
//       evaluation: 4.56,
//       imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
//   CompanyAccount(
//       id: '3',
//       name: 'Clínica OdontoMais',
//       email: 'clinic.odontomais@gmail.com',
//       availableSchedules: 0,
//       meanTime: 120,
//       evaluation: 4.99,
//       imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
//   CompanyAccount(
//       id: '4',
//       name: 'Clínica OdontoMais',
//       email: 'clinic.odontomais@gmail.com',
//       availableSchedules: 0,
//       meanTime: 30,
//       evaluation: 4.56,
//       imageURL: 'https://i.imgur.com/GhY98W6.jpg'),
// ];

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
