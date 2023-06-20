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
          style: const TextStyle(color: Colors.black),),
      ),
      child: GestureDetector(
        onTap: (  
          (){
            if(pet.especie==1)
            {
              dados.atribuiCachorro(dados);
              if(pet.porte==1){
                dados.atribuiC1(dados);
              }
              else if(pet.porte==2){
                dados.atribuiC2(dados);
              }
              else if(pet.porte==3){
                dados.atribuiC3(dados);
              }
            }
            else
            {
              dados.atribuiGato(dados);
               if(pet.porte==1){
                dados.atribuiG1(dados);
              }
              else if(pet.porte==2){
                dados.atribuiG2(dados);
              }
            }
             Navigator.of(context).pushNamed('/home-screen', arguments: pet);
            }
        ),
        child: const Card(),
        )
      );
  }
}