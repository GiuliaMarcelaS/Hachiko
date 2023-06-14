import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:hachiko/componentes/item_de_medicoes.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:hachiko/componentes/medicoes_grid.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';

class MedicoesScreen extends StatefulWidget {
  const MedicoesScreen({super.key});

  @override
  State<MedicoesScreen> createState() => _MedicoesScreenState();
}

class _MedicoesScreenState extends State<MedicoesScreen> {

  @override
  // void initState() {
  //   super.initState();
  //   Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes();
  // }


  
  @override
  Widget build(BuildContext context) {
 final auth = Provider.of<Auth>(context, listen: false);
 Future<void> refreshMedicoes(BuildContext context){
    return Provider.of<ListaDeMedicoes>(
      context,
      listen: false,
    ).carregaMedicoes(auth.token??'',auth.userId??'');
  }
    final lista = Provider.of<ListaDeMedicoes>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('medições'),
      ),
      body: 
          Column(
            children: [
              RefreshIndicator(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MedicoesGrid(),
                ),
                onRefresh: ()=>refreshMedicoes(context),
                ),
              TextButton(onPressed:()=> refreshMedicoes(context), child: Text("atualizar")),
             // TextButton(onPressed:()=> lista.salvaMedicoes, child: Text("atualizar")),
            ],
          ),
      );
  }
}
