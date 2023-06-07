import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:hachiko/componentes/item_de_medicoes.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:hachiko/componentes/medicoes_grid.dart';
import 'package:provider/provider.dart';

class MedicoesScreen extends StatefulWidget {
  const MedicoesScreen({super.key});

  @override
  State<MedicoesScreen> createState() => _MedicoesScreenState();
}

class _MedicoesScreenState extends State<MedicoesScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes();
  }

  Future<void> refreshMedicoes(BuildContext context){
    return Provider.of<ListaDeMedicoes>(
      context,
      listen: false,
    ).carregaMedicoes();
  }

  
  @override
  Widget build(BuildContext context) {
    final lista = Provider.of<ListaDeMedicoes>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('medições'),
      ),
      body: 
          Column(
            children: [
              MedicoesGrid(),
              TextButton(onPressed:()=> refreshMedicoes(context), child: Text("atualizar")),
             // TextButton(onPressed:()=> lista.salvaMedicoes, child: Text("atualizar")),
            ],
          ),
      );
  }
}
