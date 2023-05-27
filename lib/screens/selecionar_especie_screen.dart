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
        centerTitle: true,
        title: Text("O seu pet corresponde a qual animal?"),
      ),
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: ()=>dados.atribuiCachorro(dados),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                child:ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset('assets/images/cachorro.png',fit: BoxFit.fill,)),
                color: dados.botaoA==1?Colors.yellow:Color.fromRGBO(33,57,98,1),
                width: 170,
                height: 190,
                margin: EdgeInsets.only(bottom: 50, top: 20),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: ()=>dados.atribuiGato(dados),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                child: ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset('assets/images/gato.png')),
                color:dados.botaoA==2?Colors.yellow: Color.fromRGBO(33,57,98,1),
                width: 176,
                height: 200,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 20,top: 40),
            child: ElevatedButton(
              child: Text('Próximo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,194, 102, 26)
              ),
              onPressed:()=>_porte(context),
            ),
          ),
        ],
      )
    );
  }
}
