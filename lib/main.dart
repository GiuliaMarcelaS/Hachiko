import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'componentes/medicoes.dart';
import 'screens/medicoes_screen.dart';
void main() {
  runApp(const MyApp());
}

// Future<void> carregaMedicoes() async{
//   final response = await http.get(Uri.parse("https://hachiko-54054-default-rtdb.firebaseio.com/.json"));
//   print(jsonDecode(response.body));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListaDeMedicoes()),
          
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(      
          colorScheme: 
          ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.deepOrange),
          canvasColor: Color.fromRGBO(33,57,98,1)
        ),
        routes: {
          '/': (ctx) => const MedicoesScreen()
          },
      ),
    );
  }
}

