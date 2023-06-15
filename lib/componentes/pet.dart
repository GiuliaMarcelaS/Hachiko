import 'package:flutter/cupertino.dart';

class Pet with ChangeNotifier{
  int id;
  String nome;
  int especie;
  int porte;

  Pet({
    this.id = 0,
    this.nome = "",
    this.especie = 0,
    this.porte = 0,
  });
}