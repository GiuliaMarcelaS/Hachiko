import 'package:flutter/material.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:provider/provider.dart';

class NomePetScreen extends StatefulWidget {
  const NomePetScreen({super.key});

  @override
  State<NomePetScreen> createState() => _NomePetScreenState();
}

class _NomePetScreenState extends State<NomePetScreen> {
   _especie(BuildContext context){
      Navigator.of(context).pushNamed('/especie-screen');
}
  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosPet>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Primeiro, qual o nome do seu pet?')),
      body: Form(
          child: TextField(
            decoration: const InputDecoration(labelText: 'insira o nome do seu pet',),
            onSubmitted: (nomeDigitado) {
              dados.nome = nomeDigitado;
              _especie(context);
            },
            controller: TextEditingController(),
          ),
        ),
    );
  }
}