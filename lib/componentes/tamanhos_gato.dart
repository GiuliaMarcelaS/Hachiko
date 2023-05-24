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
  

  @override
  Widget build(BuildContext context) {
     final dados = Provider.of<DadosPet>(context);
    return Column(
        children: [
          InkWell(
            onTap: ()=>dados.atribuiG1(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Recém Nascido',style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: dados.botaoC==1?Colors.yellow:Colors.white,
              padding: EdgeInsets.all(50),
            ),
          ),
          InkWell(
            onTap: ()=>dados.atribuiG2(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Adulto',style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: dados.botaoC==2?Colors.yellow:Colors.white,
              padding: EdgeInsets.all(50),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_circle_right),
            onPressed:()=>_medicoes(context),
          ),
        ],
      );
  }
}