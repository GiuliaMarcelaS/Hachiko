import 'package:flutter/material.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:provider/provider.dart';

class SelecionarEspecieScreen extends StatefulWidget {
  const SelecionarEspecieScreen({super.key});

  @override
  State<SelecionarEspecieScreen> createState() => _SelecionarEspecieScreenState();
}

class _SelecionarEspecieScreenState extends State<SelecionarEspecieScreen> {
   _porte(BuildContext context){
      Navigator.of(context).pushNamed('/porte-screen');
}

    bool selecionado = false;
    void selecionar(){
      setState(() {
        selecionado = true;
      });
    }
  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosPet>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione a espécie"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: ()=>dados.atribuiCachorro(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Cachorro',style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.symmetric(vertical: 60,horizontal: 10),
              color: dados.botaoA==1?Colors.yellow:Colors.white,
              padding: EdgeInsets.all(50),
            ),
          ),
          InkWell(
            onTap: ()=>dados.atribuiGato(dados),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Text('Gato',style: TextStyle(fontSize: 30),),
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              color:dados.botaoA==2?Colors.yellow:Colors.white,
              padding: EdgeInsets.all(60),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_circle_right),
            onPressed:()=>_porte(context),
          ),
        ],
      )
    );
  }
}
