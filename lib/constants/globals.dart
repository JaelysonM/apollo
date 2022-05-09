import 'package:flutter/material.dart';

List<String> DAYS_ARRAY = [
  'domingo',
  'segunda-feira',
  'terça-feira',
  'quarta-feira',
  'quinta-feira',
  'sexta-feira',
  'sábado'
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

class StepFormSection {
  final String label;
  final TextInputType textInputType;
  final Widget? child;

  StepFormSection({
    required this.label,
    this.textInputType = TextInputType.text,
    this.child,
  });
}

class StepForm {
  final String title;
  final String description;
  final List<StepFormSection> steps;

  StepForm({
    required this.title,
    required this.description,
    required this.steps,
  });
}
