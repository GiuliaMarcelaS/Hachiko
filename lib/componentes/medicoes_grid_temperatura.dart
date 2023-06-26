
import 'package:flutter/material.dart';
import 'package:hachiko/componentes/item_de_medicoes_temperatura.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

class MedicoesGridTemperatura extends StatelessWidget {
  const MedicoesGridTemperatura({super.key});


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ListaDeMedicoes>(context);
    final List<Medicoes> medicoesCarregadas = provider.items;
    return SizedBox(
      height: 720,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: medicoesCarregadas.length,
        itemBuilder: (ctx, i) => ItemDeMedicoesTemperatura(medicoes: medicoesCarregadas[i]),
        ),
    );
  }
}