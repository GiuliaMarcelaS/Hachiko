import 'package:flutter/material.dart';

class SelecionarEspecieScreen extends StatelessWidget {
  const SelecionarEspecieScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione a espécie"),
      ),
      body: ElevatedButton(child: Text('teste'),onPressed:(){} ,)
    );
  }
}
