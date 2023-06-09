import 'package:flutter/material.dart';
import 'package:hachiko/componentes/calendario.dart';
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
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<Auth>(context, listen: false);
    final petList = Provider.of<PetList>(context,listen: false);
    Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoes(auth.token??'',auth.userId??'',petList.key);
  }
  @override
  Widget build(BuildContext context) {
 int id = 1;
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
             Container(
                color: Color.fromARGB(200, 255, 255, 255),
                child: Text("OBS : pequenas alterações cardíacas isoladas podem indicar susto, atividade física intensa, entre outros. Entretanto, caso as alterações sejam frequêntes (acima de 3 no dia), é indicado marcar exame para o animal.",
                style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              RefreshIndicator(
                child: const Padding(
                  padding: EdgeInsets.all(0),
                  child: MedicoesGridBatimentos(),
                ),
                onRefresh: ()=>refreshMedicoes(context),
                ),
             // TextButton(onPressed:()=> refreshMedicoes(context), child: const Text("medir em tempo real")),
            ],
          ),
      );
  }
}
