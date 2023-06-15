import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hachiko/componentes/auth.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';

class NomePetScreen extends StatefulWidget {
  const NomePetScreen({super.key});

  @override
  State<NomePetScreen> createState() => _NomePetScreenState();
}

class _NomePetScreenState extends State<NomePetScreen> {
  String nome = '';
  @override
  Widget build(BuildContext context) {
    final petList = Provider.of<PetList>(context);
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Primeiro, qual o nome do seu pet?')),
      body: Form(
          child: TextField(
            decoration: const InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (nomeDigitado) {
              nome = nomeDigitado;
              petList.carregaPets(auth.token??'', auth.userId??'', nome);
            },
            controller: TextEditingController(),
          ),
        ),
    );
  }
}