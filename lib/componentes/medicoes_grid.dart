import 'package:flutter/material.dart';
import 'package:hachiko/componentes/item_de_medicoes.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

class MedicoesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListaDeMedicoes>(context);
    final List<Medicoes> medicoesCarregadas = provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: medicoesCarregadas.length,
      itemBuilder: (ctx, i) => ItemDeMedicoes(medicoes: medicoesCarregadas[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10), 
      );
  }
}