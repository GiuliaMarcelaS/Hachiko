
import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class ItemDeMedicoesBatimentos extends StatelessWidget {
  final Medicoes medicoes;
  const ItemDeMedicoesBatimentos({
    Key? key,
    required this.medicoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosPet>(context);
    bool teste = true;
    Text mensagemBatimentos = dados.analiseBatimentos(medicoes.id,medicoes.batimento,medicoes.dia,medicoes.mes,medicoes.ano);
    return Card(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  medicoes.dia,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "/${medicoes.mes}/",
                  textAlign: TextAlign.center,
                ),
                Text(
                  medicoes.ano,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '  ${medicoes.hora}:',
                  textAlign: TextAlign.center,
                ),
                Text(
                  medicoes.minuto,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              "Batimentos:${medicoes.batimento.toString()}",
              textAlign: TextAlign.center,
            ),

            mensagemBatimentos,
            Text(dados.indicadorRiscoB.toString()),
          ],
        ),
      );
  }
}