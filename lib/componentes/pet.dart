import 'package:flutter/cupertino.dart';

class Pet with ChangeNotifier{
  String id;
  String nome;
  int especie;
  int porte;

  Pet({
    this.id = '',
    this.nome = "",
    this.especie = 0,
    this.porte = 0,
  });
}