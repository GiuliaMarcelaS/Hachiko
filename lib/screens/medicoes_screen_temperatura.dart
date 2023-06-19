import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:hachiko/componentes/item_de_medicoes_batimentos.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';
import 'package:hachiko/componentes/medicoes_grid_temperatura.dart';

import '../componentes/auth.dart';
import '../componentes/pet.dart';

class MedicoesScreenTemperatura extends StatefulWidget {
  const MedicoesScreenTemperatura({super.key});

  @override
  State<MedicoesScreenTemperatura> createState() => _MedicoesScreenStateTemperatura();
}

class _MedicoesScreenStateTemperatura extends State<MedicoesScreenTemperatura> {

  @override
  // void initState() {
  //   super.initState();
  //   Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes();
  // }


  
  @override
  Widget build(BuildContext context) {
 final auth = Provider.of<Auth>(context, listen: false);
 final pet = Provider.of<Pet>(context);
 final petList = Provider.of<PetList>(context);
 Future<void> refreshMedicoes(BuildContext context){
    return Provider.of<ListaDeMedicoes>(
      context,
      listen: false,
    ).carregaMedicoes(auth.token??'',auth.userId??'',petList.key);
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
                  child: MedicoesGridTemperatura(),
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
