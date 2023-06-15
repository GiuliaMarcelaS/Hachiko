
import 'package:flutter/material.dart';
import 'package:hachiko/componentes/item_de_medicoes_batimentos.dart';
import 'package:hachiko/componentes/item_de_medicoes_temperatura.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class MedicoesGridTemperatura extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final provider = Provider.of<ListaDeMedicoes>(context);
    final List<Medicoes> medicoesCarregadas = provider.items;
    return SizedBox(
      height: 480,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: medicoesCarregadas.length,
        itemBuilder: (ctx, i) => ItemDeMedicoesTemperatura(medicoes: medicoesCarregadas[i]),
        ),
    );
  }
}