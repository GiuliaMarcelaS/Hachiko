import 'package:flutter/material.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';
import 'package:hachiko/componentes/medicoes_grid_temperatura.dart';
import '../componentes/auth.dart';


class MedicoesScreenTemperatura extends StatefulWidget {
  const MedicoesScreenTemperatura({super.key});

  @override
  State<MedicoesScreenTemperatura> createState() => _MedicoesScreenStateTemperatura();
}

class _MedicoesScreenStateTemperatura extends State<MedicoesScreenTemperatura> {

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<Auth>(context, listen: false);
    final petList = Provider.of<PetList>(context,listen: false);
    Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes(auth.token??'',auth.userId??'',petList.key);
  }

  
  @override
  Widget build(BuildContext context) {
 final auth = Provider.of<Auth>(context, listen: false);
 final petList = Provider.of<PetList>(context, listen: false);
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
                  padding: EdgeInsets.all(8),
                  child: MedicoesGridTemperatura(),
                ),
                onRefresh: ()=>refreshMedicoes(context),
                ),
              TextButton(onPressed:()=> refreshMedicoes(context), child: const Text("atualizar")),
            ],
          ),
      );
  }
}
