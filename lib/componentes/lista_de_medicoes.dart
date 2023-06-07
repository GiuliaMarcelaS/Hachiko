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
  final response = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoes/.json"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  print(dados);
    _items.add(Medicoes(
      ano: dados['ANO'], 
      batimento: dados['BATIMENTOS'], 
      dia: dados['DIA'], 
      diasemana: dados['DIASEMANA'],
      hora: dados['HORA'],
      mes: dados['MES'], 
      minuto: dados['MINUTO'], 
      temperatura: dados['TEMPERATURA'],
      )
      );
       http.post(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoesAnteriores.json"),
   body: jsonEncode({
      "ano": dados['ANO'], 
      "batimento":  dados['BATIMENTOS'], 
      "dia": dados['DIA'], 
      "diasemana":dados['DIASEMANA'],
      "hora": dados['HORA'],
      "mes":dados['MES'], 
      "minuto": dados['MINUTO'], 
      "temperatura": dados['TEMPERATURA'],
   })
   );
  notifyListeners();
}
  void salvaMedicoes(Medicoes medicoes) {
   http.post(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoesAnteriores.json"),
   body: jsonEncode({
      "ano": medicoes.ano, 
      "batimento": medicoes.batimento, 
      "dia": medicoes.dia, 
      "diasemana": medicoes.diasemana,
      "hora": medicoes.hora,
      "mes": medicoes.mes, 
      "minuto": medicoes.minuto, 
      "temperatura": medicoes.temperatura,
   })
   );
   _items.add(medicoes);
   print(medicoes);
  notifyListeners();
}


}