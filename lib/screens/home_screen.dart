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
      body: Center(
        child: Column(
          children: [
            Container(
              child: IconButton(
                icon: Icon(Icons.monitor_heart, color: Colors.amber,size: 150,),
                onPressed: ()=> _medicoesBatimentos(context),),
                width: 300,
                height: 200,
                margin: EdgeInsets.only(top:50,right: 50,left: 50),
            ),
            Text("Frequência Cardíaca",style: TextStyle(color: Colors.amber,fontSize: 20),),
            Container(
              child: IconButton(
                icon: Icon(Icons.thermostat_outlined,color: Colors.amber,size: 150,),
                onPressed: ()=> _medicoesTemperatura(context),),
               width: 300,
               height: 200,
               margin: EdgeInsets.only(top:90,right: 50,left: 50),
            ),
            Text("Temperatura",style: TextStyle(color: Colors.amber,fontSize: 20),),
          ],
        ),
      )
    );
  }
}