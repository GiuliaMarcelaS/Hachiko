
import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class ItemDeMedicoesTemperatura extends StatelessWidget {
  final Medicoes medicoes;
  const ItemDeMedicoesTemperatura({
    Key? key,
    required this.medicoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosPet>(context);
    Text mensagemTemperatura = dados.analiseTemperatura(medicoes.temperatura,medicoes.dia,medicoes.mes,medicoes.ano);
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
              "Temperatura:${medicoes.temperatura.toString()}",
              textAlign: TextAlign.center,
            ),
            
            mensagemTemperatura,
            Text(dados.indicadorRiscoT.toString()),
          ],
        ),
      );
  }
}