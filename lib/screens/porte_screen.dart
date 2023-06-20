import 'package:flutter/material.dart';
import 'package:hachiko/componentes/tamanhos_cachorro.dart';
import 'package:hachiko/componentes/tamanhos_gato.dart';
import 'package:provider/provider.dart';

import '../componentes/dados_pet.dart';

class PorteScreen extends StatelessWidget {
  const PorteScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final dados = Provider.of<DadosPet>(context);
     retornarEspecie() {
      if(dados.especiePet == 1){
        return const TamanhoCachorro();
      }
      else if(dados.especiePet == 2){
        return const TamanhoGato();
      }
     }

     StatelessWidget? especie = retornarEspecie(); 

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Selecione o tamanho do pet'),
      ),
      body:especie,
    );
  }
}