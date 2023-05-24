import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        return TamanhoCachorro();
      }
      else if(dados.especiePet == 2){
        return TamanhoGato();
      }
     }

     StatelessWidget? especie = retornarEspecie(); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione o tamanho do pet'),
      ),
      body:especie,
    );
  }
}