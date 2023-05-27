import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Medicoes with ChangeNotifier{
  final String dia;
  final String mes;
  final String ano;
  final String hora;
  final String minuto;
  final double batimento;
  final double temperatura;
  final String diasemana;

  Medicoes({
    required this.dia,
    required this.mes,
    required this.ano,
    required this.hora,
    required this.minuto,
    required this.batimento,
    required this.temperatura,
    required this.diasemana,
  });
  
}
