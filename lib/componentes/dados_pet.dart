import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DadosPet with ChangeNotifier{
  int tipoPet;
  int especiePet;
  bool botao1;
  bool botao2;
  int botaoA;
  int botaoB;
  int botaoC;
  int indicadorRiscoT;
  int indicadorRiscoB;
  String dia;
  String mes;
  String ano;
  Set ids;
  String nome;
  // ignore: unused_field
  final String _token;
  // ignore: unused_field
  final String _userId;


  DadosPet(
    this._token,
    this._userId,
    this.ids,{
   this.tipoPet = 0,
   this.especiePet = 0,
   this.botao1 = false,
   this.botao2 = false,
   this.botaoA = 0,
   this.botaoB = 0,
   this.botaoC = 0,
   this.indicadorRiscoT = 0,
   this.indicadorRiscoB = 0,
   this.dia='',
   this.mes='',
   this.ano='',
   this.nome='',
  }
  );

  Future<void> salvaPet(String token, String userId, String nome, int especie, int porte) async{
   http.post(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/$userId/pets/.json"),
   body: jsonEncode({
      'nome': nome,
      'especie': especie,
      'porte': porte,
   })
   );
  notifyListeners();
}

  atribuiCachorro (DadosPet dados){
  especiePet = 1;
  botaoA = 1;
  notifyListeners();
 }
  atribuirCachorro (int providerEspecie){
  especiePet = providerEspecie;
  notifyListeners();
 }
  atribuiGato (DadosPet dados){
  especiePet = 2;
  botaoA = 2;
  notifyListeners();
 }
  atribuiC1 (DadosPet dados){
  tipoPet = 1;
  botaoB = 1;
  notifyListeners();
 }
  atribuiC2 (DadosPet dados){
  tipoPet = 2;
  botaoB = 2;
  notifyListeners();
 }
  atribuiC3 (DadosPet dados){
  tipoPet = 3;
  botaoB = 3;
  notifyListeners();
 }
  atribuiG1 (DadosPet dados){
  tipoPet = 4;
  botaoC = 1;
  notifyListeners();
 }
  atribuiG2 (DadosPet dados){
  tipoPet = 5;
  botaoC = 2;
  notifyListeners();
 }


 analiseTemperatura (double temperatura, String mdia, String mmes, String mano){
   if(dia==''&&mes==''&&ano==''){
        dia = mdia;
        mes = mmes;
        ano = mano;
      }
     if(dia != mdia|| mes!=mmes|| ano!=mano){
      indicadorRiscoT=0;
     }
  if(especiePet == 2){
    if (temperatura>=38 && temperatura<=39){
      return const Text('temperatura normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
    else{
      if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoT++;
        if(indicadorRiscoT>=3){
          return Text('temperatura alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram temperatura alterada, marque um exame para seu pet!\n'.toUpperCase()}',textAlign: TextAlign.center,style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoT =0;
      }
      return const Text('temperatura alta',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }
    
  }
   else if(especiePet == 1){
    if (temperatura>=38 && temperatura<=39.2){
      return const Text('temperatura normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
    else{
      if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoT++;
        if(indicadorRiscoT>=3){
          return Text('temperatura alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram temperatura alterada, marque um exame para seu pet!\n'.toUpperCase()}',textAlign: TextAlign.center,style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoT =0;
      }
      return const Text('temperatura alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }
    
  }
 }

 analiseBatimentos(String id,int batimentos, String mdia, String mmes, String mano){
  ids.add(id);
  if(dia==''&&mes==''&&ano==''){
        dia = mdia;
        mes = mmes;
        ano = mano;
      }
      if(dia != mdia|| mes!=mmes|| ano!=mano){
      indicadorRiscoB=0;
     }
  if(tipoPet == 1){
    if(batimentos >=70 && batimentos<=180){
      return  const Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano&&(ids.contains(id)==false)){
        indicadorRiscoB++;
        if(indicadorRiscoB>=3){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return const Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
  else if(tipoPet==2){
     if(batimentos >=70 && batimentos<=160){
      return  const Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano&&(ids.contains(id)==false)){
        indicadorRiscoB++;
        if(indicadorRiscoB>=3){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return const Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }
    
  }
  else if(tipoPet==3){
     if(batimentos >=60 && batimentos<=140){
      return  const Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano&&(ids.contains(id)==false)){
        indicadorRiscoB++;
        if(indicadorRiscoB>=3){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return const Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
  else if(tipoPet==4){
     if(batimentos >=220 && batimentos<=260){
      return  const Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano&&(ids.contains(id)==false)){
        indicadorRiscoB++;
        if(indicadorRiscoB>=3){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return const Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
  else if(tipoPet==5){
     if(batimentos >=120 && batimentos<=200){
      return  const Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
      if(dia == mdia&& mes==mmes&& ano==mano&&(ids.contains(id)==false)){
        indicadorRiscoB++;
        if(indicadorRiscoB>=3){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',
          textAlign: TextAlign.center,
          style: const TextStyle(color:  Color.fromARGB(255, 255, 0, 0)
          ),
          );
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return const Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
 }

}