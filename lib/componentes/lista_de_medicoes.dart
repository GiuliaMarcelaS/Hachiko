import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:hachiko/dadosTeste/dummy_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ListaDeMedicoes with ChangeNotifier{

  final List<Medicoes> _items =  [];

  List<Medicoes> get items => [..._items];


  void addMedicao(Medicoes medicoes){
    _items.add(medicoes);
    notifyListeners();
  }

  Future<void> carregaMedicoes() async{
  final response = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoesTeste/.json"));
  Map<String, dynamic> dados = jsonDecode(response.body);
  print(dados);
  dados.forEach((id, dados){
    _items.add(Medicoes(
      id: id, 
      batimento: dados['batimento'], 
      temperatura: dados['temperatura'],
      )
      );
  });
  notifyListeners();
}
}