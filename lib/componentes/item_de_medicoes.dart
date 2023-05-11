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
    return Card(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              medicoes.id,
              textAlign: TextAlign.center,
            ),
            Text(
              "Batimentos:${medicoes.batimento}",
              textAlign: TextAlign.center,
            ),
            Text(
              "Temperatura:${medicoes.temperatura}",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }
}
