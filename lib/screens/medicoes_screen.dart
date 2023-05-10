import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:provider/provider.dart';

class MedicoesScreen extends StatelessWidget {
  const MedicoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListaDeMedicoes>(context);
    final List<Medicoes> medicoesCarregadas = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medições'),
      ),
      body: 
          GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: medicoesCarregadas.length,
            itemBuilder: (ctx, i) => Text(medicoesCarregadas[i].id),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10), 
            )
      );
  }
}