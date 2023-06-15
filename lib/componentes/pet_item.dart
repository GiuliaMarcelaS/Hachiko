import 'package:flutter/material.dart';
import 'package:hachiko/componentes/pet.dart';
import 'package:provider/provider.dart';

import 'dados_pet.dart';
class PetItem extends StatelessWidget {

  const PetItem({super.key});

  @override
  Widget build(BuildContext context) {
  final dados = Provider.of<DadosPet>(context);
  final pet = Provider.of<Pet>(context);
    return GridTile(
      footer: GridTileBar(
        title: Text(
          pet.nome,
          style: TextStyle(color: Colors.black),),
      ),
      child: InkWell(
              onTap: ()=>dados.atribuirCachorro(pet.especie),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                child:ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset('assets/images/cachorro.png',fit: BoxFit.fill,)),
                color: dados.especiePet==1?Colors.yellow:Color.fromRGBO(33,57,98,1),
                width: 170,
                height: 190,
                margin: EdgeInsets.only(bottom: 50, top: 20),
              ),
            ),
      );
  }
}