import 'package:flutter/material.dart';
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

 _cadastro(BuildContext context){
      Navigator.of(context).pushNamed('/nome-pet-screen');
}
    @override
    initState(){
      super.initState();
       final pet = Provider.of<Pet>(context, listen: false);
       final auth = Provider.of<Auth>(context, listen: false);
       Provider.of<PetList>(
      context,
      listen: false,
    ).carregaPets(auth.token??'',auth.userId??'',pet.nome);
  
    }
  @override
  Widget build(BuildContext context) {
     final pet = Provider.of<Pet>(context, listen: false);
     final auth = Provider.of<Auth>(context, listen: false);

    Future<void> refreshPets(BuildContext context){
    return Provider.of<PetList>(
      context,
      listen: false,
    ).carregaPets(auth.token??'',auth.userId??'',pet.nome);
  }
    return Scaffold(
      appBar: AppBar(title: const Text("Selecione o pet"),centerTitle: true,),
      body: Column(
        children: [
          IconButton(onPressed:()=>_cadastro(context), icon: const Icon(Icons.add_circle),iconSize: 80,color: Colors.amber,),
          const PetGrid(),
          //TextButton(onPressed:()=> refreshPets(context), child: const Text("atualizar")),
        ],
      ),
    );
  }
}