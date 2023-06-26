import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';


class  ListaDeMedicoes with ChangeNotifier{
  // ignore: unused_field
  final String _token;
  // ignore: unused_field
  final String _userId;

  ListaDeMedicoes(
    this._token,
    this._userId,
  );

  final List<Medicoes> _items =  [];

  retornaMes(String mes){
    if(mes == 'January'){
      return '1';
    }
    else if(mes == 'January'){
      return '1';
    }
    else if(mes == 'February'){
      return '2';
    }
    else if(mes == 'March'){
      return '3';
    }
    else if(mes == 'April'){
      return '4';
    }
    else if(mes == 'May'){
      return '5';
    }
    else if(mes == 'June'){
      return '6';
    }
    else if(mes == 'July'){
      return '7';
    }
    else if(mes == 'August'){
      return '8';
    }
    else if(mes == 'September'){
      return '9';
    }
    else if(mes == 'October'){
      return '10';
    }
    else if(mes == 'November'){
      return '11';
    }
    else if(mes == 'December'){
      return '12';
    }
    notifyListeners();
  }

  List<Medicoes> get items {
    // return _items.where((med)=>med.igual).toList();
    return [..._items];
  }
  

  void addMedicao(Medicoes medicoes){
    _items.add(medicoes);
    notifyListeners();
  }

  Future<void> carregaMedicoes(String token, String userId, String petId) async{
   final response2 = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoesAnterioresEsp/.json?"));
   _items.clear();
  Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
  dados2.forEach((id, dados2) { 
  _items.add(Medicoes(
     id:id,
      ano: dados2['ANO'], 
      batimento: dados2['BATIMENTOS'], 
      dia: dados2['DIA'], 
      diasemana: dados2['DIASEMANA'],
      hora: dados2['HORA'],
      mes: dados2['MES'], 
      minuto: dados2['MINUTO'], 
      temperatura: dados2['TEMPERATURA'],
      )
      );
      });
  notifyListeners();
}
  Future<void> carregaMedicoesTempoReal(String token, String userId, String petId) async{
   final response = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoes/.json"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body); 
  _items.add(Medicoes(
    id: "",
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
  notifyListeners();
}
  Future<void> carregaMedicoesDatadas(String token, String userId, String dia, String mes, String ano) async{
   final response2 = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoesAnterioresEsp/.json?"));
   final response4 = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/$dia$mes$ano/.json?"));
   _items.clear();
  Map<dynamic, dynamic> dados4 = jsonDecode(response2.body);
   Map<dynamic, dynamic> dados5 = {};
   if(jsonDecode(response4.body)!=null){
  dados5 = jsonDecode(response4.body);
   }
  dados4.forEach((id, dados2) {
  if(dia==dados2['DIA']&&mes==dados2['MES']&&ano==dados2['ANO']&&dados4.length!=dados5.length){
       http.post(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/$dia$mes$ano/.json?auth=$token"),
   body: jsonEncode({
      "ano": dados2['ANO'], 
      "batimento":  dados2['BATIMENTOS'], 
      "dia": dados2['DIA'], 
      "diasemana":dados2['DIASEMANA'],
      "hora": dados2['HORA'],
      "mes":dados2['MES'], 
      "minuto": dados2['MINUTO'], 
      "temperatura": dados2['TEMPERATURA'],
   })
   );}
   });
   final response3 = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/$dia$mes$ano/.json?"));
   
   Map<dynamic, dynamic> dados3 = {};
   if(jsonDecode(response3.body)!=null){
    dados3 = jsonDecode(response3.body);
   }
  dados3.forEach((id, dados3) { 
  _items.add(Medicoes(
     id:id,
      ano: dados3['ano'], 
      batimento: dados3['batimento'], 
      dia: dados3['dia'], 
      diasemana: dados3['diasemana'],
      hora: dados3['hora'],
      mes: dados3['mes'], 
      minuto: dados3['minuto'], 
      temperatura: dados3['temperatura'],
      )
      );
      });
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
  notifyListeners();
}


}