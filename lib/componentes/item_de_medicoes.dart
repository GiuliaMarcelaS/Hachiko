
import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';

class ItemDeMedicoes extends StatelessWidget {
  final Medicoes medicoes;
  const ItemDeMedicoes({
    Key? key,
    required this.medicoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool teste = true;
    return Card(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              medicoes.id,
              textAlign: TextAlign.center,
            ),
            Text(
              "Batimentos:${medicoes.batimento.toString()}",
              textAlign: TextAlign.center,
            ),
            Text(
              "Temperatura:${medicoes.temperatura.toString()}",
              textAlign: TextAlign.center,
            ),
            medicoes.temperatura > 39? Text('temperatura alta',style: TextStyle(color: Colors.red),): Text('temperatura normal',style: TextStyle(color: Colors.green)),
            medicoes.batimento>90 ? Text('bpm alto',style: TextStyle(color: Colors.red),): Text('bpm normal',style: TextStyle(color: Colors.green)),

          ],
        ),
      );
  }
}
