import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendario with ChangeNotifier{
   data(BuildContext context){
      Navigator.of(context).pushNamed('/data-screen');}


  DateTime selectedDate = DateTime.now();
  String dataEscrita = "";
  String dia = "";
  String ano = "";
  String mesA = "";
  String mes = "";
  mostrarCalendario(BuildContext context){
    showDatePicker(context:context,
     initialDate: DateTime.now(),
      firstDate: DateTime(2023),
       lastDate: DateTime.now()
       ).then((pickedDate){
        if(pickedDate==null){
          return;
        }
        selectedDate = pickedDate;
        dataEscrita = DateFormat('dd/MM/yyyy').format(pickedDate);
        dia = dataEscrita[0]+dataEscrita[1];
        ano = dataEscrita[6]+dataEscrita[7]+dataEscrita[8]+dataEscrita[9];
        mesA = dataEscrita[3]+dataEscrita[4];
        if(mesA=='01'){
          mes = "January";
        }
        else if(mesA =="02"){
          mes = 'February';
        }
        else if(mesA =="03"){
          mes = 'March';
        }
        else if(mesA =="04"){
          mes = 'April';
        }
        else if(mesA =="05"){
          mes = 'May';
        }
        else if(mesA =="06"){
          mes = 'June';
        }
        else if(mesA =="07"){
          mes = 'July';
        }
        else if(mesA =="08"){
          mes = 'August';
        }
        else if(mesA =="09"){
          mes = 'September';
        }
        else if(mesA =="10"){
          mes = 'October';
        }
        else if(mesA =="11"){
          mes = 'November';
        }
        else if(mesA =="12"){
          mes = 'December';
        }
        data(context);
      });
  }
}