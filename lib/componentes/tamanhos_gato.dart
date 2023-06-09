import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class TamanhoGato extends StatelessWidget {
  const TamanhoGato({super.key});
  _medicoes(BuildContext context){
      Navigator.of(context).pushNamed('/medicoes-screen');
}
  _home(BuildContext context){
      Navigator.of(context).pushNamed('/home-screen');
}

  @override
  Widget build(BuildContext context) {
     final dados = Provider.of<DadosPet>(context);
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: ElevatedButton(
                onPressed: ()=>dados.atribuiG1(dados),
                child: Text('Recém Nascido',style: TextStyle(fontSize: 20)),
                style: dados.botaoC==1? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              ),
              width: 400,
               height: 50,
               margin: EdgeInsets.only(bottom: 20, top:20),
            ),
              Container(
                child: ElevatedButton(
                onPressed: ()=>dados.atribuiG2(dados),
                child: Text('Adulto',style: TextStyle(fontSize: 20)),
                style: dados.botaoC==2? ElevatedButton.styleFrom(backgroundColor: null):ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)),
            ),
             width: 400,
              height: 50,
              margin: EdgeInsets.only(bottom: 360),
              ),
        Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 20),
            child: ElevatedButton(
              child: Text('Próximo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,194, 102, 26)
              ),
              onPressed:()=>_home(context),
            ),
          ),
        ],
      );
  }
}