import 'package:flutter/material.dart';
import 'package:hachiko/componentes/calendario.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/medicoes_grid_temperatura.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';
import '../componentes/medicoes_grid_batimentos.dart';

class MedicoesScreenTemperatura extends StatefulWidget {
  const MedicoesScreenTemperatura({super.key});

  @override
  State<MedicoesScreenTemperatura> createState() => _MedicoesScreenTemperaturaState();
}

class _MedicoesScreenTemperaturaState extends State<MedicoesScreenTemperatura> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<Auth>(context, listen: false);
    final petList = Provider.of<PetList>(context,listen: false);
    Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes(auth.token??'',auth.userId??'',petList.key);
  }
  _data(BuildContext context){
      Navigator.of(context).pushNamed('/data-screen');}

  @override
  Widget build(BuildContext context) {
    int id = 2;
 final auth = Provider.of<Auth>(context, listen: false);
 final calendario = Provider.of<Calendario>(context);
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
        actions: <Widget>[
          IconButton(onPressed:(){
            calendario.mostrarCalendario(context,id);
            }, icon: Icon(Icons.calendar_month))
        ],
      ),
      body: 
          Column(
            children: [
              RefreshIndicator(
                child: const Padding(
                  padding: EdgeInsets.all(0),
                  child: MedicoesGridTemperatura(),
                ),
                onRefresh: ()=>refreshMedicoes(context),
                ),
             // TextButton(onPressed:()=> refreshMedicoes(context), child: const Text("medir em tempo real")),
            ],
          ),
      );
  }
}
