import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:hachiko/dadosTeste/dummy_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class  ListaDeMedicoes with ChangeNotifier{
  final String _token;
  final String _userId;

  ListaDeMedicoes(
    this._token,
    this._userId,
  );

  final List<Medicoes> _items =  [];

  List<Medicoes> get items => [..._items];


  void addMedicao(Medicoes medicoes){
    _items.add(medicoes);
    notifyListeners();
  }

  Future<void> carregaMedicoes(String token, String userId, String petId) async{
  final response = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/medicoes/.json"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  print(dados);
       http.post(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/medicoesAnteriores/.json?auth=$token"),
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
   ); print(petId);
   final response2 = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/medicoesAnteriores/.json?"));
 _items.clear();
  Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
  print(dados2);
  dados2.forEach((id, dados2) { 
  _items.add(Medicoes(
      id:id,
      ano: dados2['ano'], 
      batimento: dados2['batimento'], 
      dia: dados2['dia'], 
      diasemana: dados2['diasemana'],
      hora: dados2['hora'],
      mes: dados2['mes'], 
      minuto: dados2['minuto'], 
      temperatura: dados2['temperatura'],
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
   print(medicoes);
  notifyListeners();
}


}