import 'package:flutter/material.dart';
import 'package:hachiko/componentes/auth.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class TamanhoGato extends StatelessWidget {
  const TamanhoGato({super.key});
  _pets(BuildContext context){
      Navigator.of(context).pushNamed('/selecionar-pet-screen');
}

  @override
  Widget build(BuildContext context) {
     final dados = Provider.of<DadosPet>(context);
     final auth = Provider.of<Auth>(context,listen: false);
    return Column(

        children: [
          Container(
              width: 400,
               height: 50,
               margin: const EdgeInsets.only(bottom: 20, top:20),
              child: ElevatedButton(
                onPressed: ()=>dados.atribuiG1(dados),
                style: dados.botaoC==1? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Recém Nascido',style: TextStyle(fontSize: 20)),
              ),
            ),
              Container(
                width: 400,
              height: 50,
              margin: const EdgeInsets.only(bottom: 360),
                child: ElevatedButton(
                onPressed: ()=>dados.atribuiG2(dados),
                style: dados.botaoC==2? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Adulto',style: TextStyle(fontSize: 20)),
            ),
              ),
        Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255,194, 102, 26)
              ),
              onPressed:(){
                dados.salvaPet(auth.token??'', auth.userId??'', dados.nome, dados.especiePet, dados.tipoPet);
                _pets(context);
              },
              child: const Text('Próximo'),
            ),
          ),
        ],
      );
  }
}