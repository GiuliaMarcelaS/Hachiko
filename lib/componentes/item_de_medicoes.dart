<<<<<<< HEAD
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:hachiko/componentes/medicoes.dart';

// class ItemDeMedicoes extends StatelessWidget {
//   final Medicoes medicao;
//   const ItemDeMedicoes({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
=======

import 'package:flutter/material.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class ItemDeMedicoes extends StatelessWidget {
  final Medicoes medicoes;
  const ItemDeMedicoes({
    Key? key,
    required this.medicoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosPet>(context);
    bool teste = true;
    Text mensagemTemperatura = dados.analiseTemperatura(medicoes.temperatura);
    Text mensagemBatimentos = dados.analiseBatimentos(medicoes.batimento);
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
            mensagemTemperatura,
            mensagemBatimentos
          ],
        ),
      );
  }
}
>>>>>>> a8b0cf919273573eacbaeb39ed3e2a6307098727
