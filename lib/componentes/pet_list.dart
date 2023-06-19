import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hachiko/componentes/pet.dart';
import 'package:http/http.dart' as http;

class PetList with ChangeNotifier{
  final String _token;
  final String _userId;
  String key;

  PetList(
    this._token,
    this._userId,
    {this.key=''}
  );

  final List<Pet> _items = [];

  List<Pet> get items => [..._items];

  Future<void> carregaPets(String token, String userId, String pet) async{
  final response = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/pets/.json"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  print(dados);
 _items.clear();
  dados.forEach((id, dados) { 
  _items.add(Pet(
      id: id,
      nome: dados['nome'],
      especie:dados['especie'],
      porte:dados['porte'],
      )
      );
      key = id;
      });
  notifyListeners();
}
  void addFase(Pet pet){
    _items.add(pet);
    notifyListeners();
  }
}