import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hachiko/componentes/auth.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class TamanhoCachorro extends StatelessWidget {
  const TamanhoCachorro({super.key});
  _medicoes(BuildContext context){
      Navigator.of(context).pushNamed('/medicoes-screen');
}
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
              child: ElevatedButton(
                onPressed: ()=>dados.atribuiC1(dados),
                child: Text('Recém Nascido',style: TextStyle(fontSize: 20)),
                style: dados.botaoB==1? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              ),
              width: 400,
              height: 50,
              margin: EdgeInsets.only(bottom: 20, top:20),
            ),
              Container(
                child: ElevatedButton(
                onPressed: ()=>dados.atribuiC2(dados),
                child: Text('Pequeno Porte',style: TextStyle(fontSize: 20)),
                style: dados.botaoB==2? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            ),
             width: 400,
             height: 50,
             margin: EdgeInsets.only(bottom: 20),
              ),
              Container(
                child: ElevatedButton(
                onPressed: ()=>dados.atribuiC3(dados),
                child: Text('Grande Porte',style: TextStyle(fontSize: 20)),
                style: dados.botaoB==3? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            ),
             width: 400,
             height: 50,
             margin: EdgeInsets.only(bottom: 20),
              ),
            Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 20,top: 270),
            child: ElevatedButton(
              child: Text('Próximo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,194, 102, 26)
              ),
              onPressed:(){
                dados.salvaPet(auth.token??'',auth.userId??'',dados.nome,dados.especiePet,dados.tipoPet);
                _home(context);
              }
            ),
          ),
          ],
        ),
    );
  }
}