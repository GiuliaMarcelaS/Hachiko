import 'package:flutter/material.dart';
import 'package:hachiko/componentes/auth.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class TamanhoCachorro extends StatelessWidget {
  const TamanhoCachorro({super.key});
  _home(BuildContext context){
      Navigator.of(context).pushNamed('/home-screen');
}

  @override
  Widget build(BuildContext context) {
     final dados = Provider.of<DadosPet>(context);
     final auth = Provider.of<Auth>(context, listen: false);
    return Center(
      child: Column(
          children: [
            Container(
              width: 400,
              height: 50,
              margin: const EdgeInsets.only(bottom: 20, top:20),
              child: ElevatedButton(
                onPressed: ()=>dados.atribuiC1(dados),
                style: dados.botaoB==1? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Recém Nascido',style: TextStyle(fontSize: 20)),
              ),
            ),
              Container(
                width: 400,
             height: 50,
             margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                onPressed: ()=>dados.atribuiC2(dados),
                style: dados.botaoB==2? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Pequeno Porte',style: TextStyle(fontSize: 20)),
            ),
              ),
              Container(
                width: 400,
             height: 50,
             margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                onPressed: ()=>dados.atribuiC3(dados),
                style: dados.botaoB==3? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Grande Porte',style: TextStyle(fontSize: 20)),
            ),
              ),
            Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.only(right: 20,top: 270),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255,194, 102, 26)
              ),
              onPressed:(){
                dados.salvaPet(auth.token??'',auth.userId??'',dados.nome,dados.especiePet,dados.tipoPet);
                _home(context);
              },
              child: const Text('Próximo')
            ),
          ),
          ],
        ),
    );
  }
}