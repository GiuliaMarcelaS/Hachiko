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
        title: Center(
          child: Text(
            pet.nome,
            style: const TextStyle(color:Colors.deepOrange,fontSize: 20),),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top:40 ,bottom:40 ,left:40 ,right:40 ),
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
          child: pet.especie==1? ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset('assets/images/cachorro2.png',fit: BoxFit.fill,)):ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset('assets/images/gato2.png',fit: BoxFit.fill,)),
          ),
      )
      );
  }
}