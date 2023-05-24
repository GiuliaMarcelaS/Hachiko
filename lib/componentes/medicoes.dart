import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Medicoes with ChangeNotifier{
  final String id;
  final int dia;
  final int mes;
  final int ano;
  final String horario;
  final double batimento;
  final double temperatura;

  Medicoes({
    required this.id,
    required this.dia,
    required this.mes,
    required this.ano,
    required this.horario,
    required this.batimento,
    required this.temperatura,
  });
  
}
