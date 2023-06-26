import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hachiko/componentes/calendario.dart';
import 'package:hachiko/componentes/medicoes_grid_temperatura.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';
import '../componentes/lista_de_medicoes.dart';
import '../componentes/medicoes_grid_batimentos.dart';
import '../componentes/pet_list.dart';

class DataTemperaturaScreen extends StatefulWidget {
  const DataTemperaturaScreen({super.key});

  @override
  State<DataTemperaturaScreen> createState() => _DataTemperaturaScreenState();
}

class _DataTemperaturaScreenState extends State<DataTemperaturaScreen> {
  @override
   void initState() {
    super.initState();
     final calendario = Provider.of<Calendario>(context,listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoesDatadas(auth.token??'',auth.userId??'',calendario.dia,calendario.mes,calendario.ano);
  }
  @override
  Widget build(BuildContext context) {
    int id = 2;
     final auth = Provider.of<Auth>(context, listen: false);
    final calendario = Provider.of<Calendario>(context);
     Future<void> refreshMedicoes(BuildContext context){
    return Provider.of<ListaDeMedicoes>(
      context,
      listen: false,
    ).carregaMedicoesDatadas(auth.token??'',auth.userId??'',calendario.dia,calendario.mes,calendario.ano);
  }
    return Scaffold(
      appBar: AppBar(
        title: Text("${calendario.dia}/${calendario.mes}/${calendario.ano}"),
        actions: <Widget>[
           IconButton(onPressed:(){
            calendario.mostrarCalendario(context,id);
            }, icon: Icon(Icons.calendar_month))
        ],
      ),
      body: Column(
            children: [
              RefreshIndicator(
                child: const Padding(
                  padding: EdgeInsets.all(8),
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