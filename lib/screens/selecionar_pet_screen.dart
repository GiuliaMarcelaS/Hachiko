import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hachiko/componentes/pet.dart';
import 'package:hachiko/componentes/pet_grid.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';

class SelecionarPetScreen extends StatefulWidget {
  const SelecionarPetScreen({super.key});

  @override
  State<SelecionarPetScreen> createState() => _SelecionarPetScreenState();
}

class _SelecionarPetScreenState extends State<SelecionarPetScreen> {


  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
     final pet = Provider.of<Pet>(context, listen: false);
    Future<void> refreshPets(BuildContext context){
    return Provider.of<PetList>(
      context,
      listen: false,
    ).carregaPets(auth.token??'',auth.userId??'',pet.nome);
  }
    return Scaffold(
      appBar: AppBar(title: Text("Selecione o pet"),),
      body: Column(
        children: [
          PetGrid(),
           TextButton(onPressed:()=> refreshPets(context), child: Text("atualizar")),
        ],
      ),
    );
  }
}