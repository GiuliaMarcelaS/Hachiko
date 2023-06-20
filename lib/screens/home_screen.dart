import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _medicoesBatimentos(BuildContext context){
      Navigator.of(context).pushNamed('/medicoes-screen-batimentos');}
  _medicoesTemperatura(BuildContext context){
      Navigator.of(context).pushNamed('/medicoes-screen-temperatura');}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Center(
            child: InkWell(
              onTap: ()=> _medicoesBatimentos(context),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.yellow,
                width: 170,
                height: 190,
                margin: const EdgeInsets.only(bottom: 50, top: 20),
                child:ClipRRect(borderRadius: BorderRadius.circular(40),child: const Text("Frequencia Carciaca")),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: ()=>_medicoesTemperatura(context),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.yellow,
                width: 170,
                height: 190,
                margin: const EdgeInsets.only(bottom: 50, top: 20),
                child:ClipRRect(borderRadius: BorderRadius.circular(40),child: const Text("Temperatura")),
              ),
            ),
          ),
        ],
      )
    );
  }
}