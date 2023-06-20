import 'package:flutter/material.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';
import '../componentes/medicoes_grid_batimentos.dart';

class MedicoesScreenBatimentos extends StatefulWidget {
  const MedicoesScreenBatimentos({super.key});

  @override
  State<MedicoesScreenBatimentos> createState() => _MedicoesScreenBatimentosState();
}

class _MedicoesScreenBatimentosState extends State<MedicoesScreenBatimentos> {

  @override
  // void initState() {
  //   super.initState();
  //   Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes();
  // }


  
  @override
  Widget build(BuildContext context) {
 final auth = Provider.of<Auth>(context, listen: false);
 final petList = Provider.of<PetList>(context,listen: false);
 Future<void> refreshMedicoes(BuildContext context){
    return Provider.of<ListaDeMedicoes>(
      context,
      listen: false,
    ).carregaMedicoes(auth.token??'',auth.userId??'',petList.key);
  }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('medições'),
      ),
      body: 
          Column(
            children: [
              RefreshIndicator(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MedicoesGridBatimentos(),
                ),
                onRefresh: ()=>refreshMedicoes(context),
                ),
              TextButton(onPressed:()=> refreshMedicoes(context), child: const Text("atualizar")),
            ],
          ),
      );
  }
}
