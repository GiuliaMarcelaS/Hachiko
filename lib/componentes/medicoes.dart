import 'package:flutter/material.dart';
class Medicoes with ChangeNotifier{
  final String id;
  final String dia;
  final String mes;
  final String ano;
  final String hora;
  final String minuto;
  final int batimento;
  final double temperatura;
  final String diasemana;
  bool igual;

  Medicoes(
    {
    required this.id,
    required this.dia,
    required this.mes,
    required this.ano,
    required this.hora,
    required this.minuto,
    required this.batimento,
    required this.temperatura,
    required this.diasemana,
    this.igual = false,
  }
  );

  toggleIgual(String dataSelecionada){
    String dataMedicao = "24/6/2023";
    igual = false;
    if(dataSelecionada == dataMedicao){
      igual = true;
    }
    print(igual);
    notifyListeners();
  }
}
