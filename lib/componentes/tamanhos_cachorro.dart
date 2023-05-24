import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';

class TamanhoCachorro extends StatelessWidget {
  const TamanhoCachorro({super.key});
  _medicoes(BuildContext context){
      Navigator.of(context).pushNamed('/medicoes-screen');
}
  

  @override
  Widget build(BuildContext context) {
     final dados = Provider.of<DadosPet>(context);
    return Column(
        children: [
          InkWell(
            onTap: ()=>dados.atribuiC1(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Recém Nascido',style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: dados.botaoB==1?Colors.yellow:Colors.white,
              padding: EdgeInsets.all(50),
            ),
          ),
          InkWell(
            onTap: ()=>dados.atribuiC2(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Pequeno Porte',style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              color: dados.botaoB==2?Colors.yellow:Colors.white,
              padding: EdgeInsets.all(50),
            ),
          ),
          InkWell(
            onTap: ()=>dados.atribuiC3(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Grande porte',style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: dados.botaoB==3?Colors.yellow:Colors.white,
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