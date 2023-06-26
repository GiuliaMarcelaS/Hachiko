import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hachiko/componentes/calendario.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';
import '../componentes/lista_de_medicoes.dart';
import '../componentes/medicoes_grid_batimentos.dart';
import '../componentes/pet_list.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
   void initState() {
    super.initState();
     final calendario = Provider.of<Calendario>(context,listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    Provider.of<ListaDeMedicoes>(context, listen: false).carregaMedicoesDatadas(auth.token??'',auth.userId??'',calendario.dia,calendario.mes,calendario.ano);
  }
  @override
  Widget build(BuildContext context) {
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
            calendario.mostrarCalendario(context);
            }, icon: Icon(Icons.calendar_month))
        ],
      ),
      body: Column(
            children: [
              Container(
                color: Color.fromARGB(200, 255, 255, 255),
                child: Text("OBS : pequenas alterações cardíacas isoladas podem indicar susto, atividade física intensa, entre outros. Entretanto, caso as alterações sejam frequêntes (acima de 3 no dia), é indicado marcar exame para o animal.",
                style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              RefreshIndicator(
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: MedicoesGridBatimentos(),
                ),
                onRefresh: ()=>refreshMedicoes(context),
                ),
              TextButton(onPressed:()=> refreshMedicoes(context), child: const Text("medir em tempo real")),
            ],
          ),
    );
  }
}