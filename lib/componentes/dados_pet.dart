import 'package:flutter/cupertino.dart';

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

  DadosPet({
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
  });

  atribuiCachorro (DadosPet dados){
  especiePet = 1;
  botaoA = 1;
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
      return Text('temperatura normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
    else{
      if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoT++;
        if(indicadorRiscoT>=6){
          return Text('temperatura alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram temperatura alterada, marque um exame para seu pet!\n'.toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoT =0;
      }
      return Text('temperatura alta',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }
    
  }
   else if(especiePet == 1){
    if (temperatura>=38 && temperatura<=39.2){
      return Text('temperatura normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
    else{
      if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoT++;
        if(indicadorRiscoT>=6){
          return Text('temperatura alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram temperatura alterada, marque um exame para seu pet!\n'.toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoT =0;
      }
      return Text('temperatura alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }
    
  }
 }

 analiseBatimentos(int batimentos, String mdia, String mmes, String mano){
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
      return  Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoB++;
        if(indicadorRiscoB>=6){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
  else if(tipoPet==2){
     if(batimentos >=70 && batimentos<=160){
      return  Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoB++;
        if(indicadorRiscoB>=6){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }
    
  }
  else if(tipoPet==3){
     if(batimentos >=60 && batimentos<=140){
      return  Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoB++;
        if(indicadorRiscoB>=6){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
  else if(tipoPet==4){
     if(batimentos >=220 && batimentos<=260){
      return  Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
       if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoB++;
        if(indicadorRiscoB>=6){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)));
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
  else if(tipoPet==5){
     if(batimentos >=120 && batimentos<=200){
      return  Text('frequência cardíaca normal',style: TextStyle(color:  Color.fromARGB(255, 0,255, 0)));
    }
     else{
      if(dia == mdia&& mes==mmes&& ano==mano){
        indicadorRiscoB++;
        if(indicadorRiscoB>=6){
          return Text('frequência cardíaca alterada.\n\n OBS: ${'muitas medições realizadas hoje apresentaram frequência cardíaca alterada, marque um exame para seu pet!'.toUpperCase()}',
          textAlign: TextAlign.center,
          style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)
          ),
          );
        }
      }
      else{
        indicadorRiscoB =0;
      }
      return Text('frequência cardíaca alterada',style: TextStyle(color:  Color.fromARGB(255, 255, 0, 0)),);
    }

  }
 }

}