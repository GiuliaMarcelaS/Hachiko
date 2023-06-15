import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hachiko/componentes/auth.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/pet.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:hachiko/screens/auth_or_home_screen.dart';
import 'package:hachiko/screens/auth_screen.dart';
import 'package:hachiko/screens/home_screen.dart';
import 'package:hachiko/screens/medicoes_screen_batimentos.dart';
import 'package:hachiko/screens/medicoes_screen_temperatura.dart';
import 'package:hachiko/screens/nome_pet_screen.dart';
import 'package:hachiko/screens/porte_screen.dart';
import 'package:hachiko/screens/selecionar_especie_screen.dart';
import 'package:hachiko/screens/selecionar_pet_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'componentes/medicoes.dart';
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
          create: (_) => Auth()),
        ChangeNotifierProvider(
          create: (_) => Pet()),
        ChangeNotifierProxyProvider<Auth,ListaDeMedicoes>(
          create: (_) => ListaDeMedicoes('',''),
          update:(ctx, auth, previous){
            return ListaDeMedicoes(auth.token??'', auth.userId??'');
          }),
        ChangeNotifierProxyProvider<Auth,PetList>(
          create: (_) => PetList('',''),
          update:(ctx, auth, previous){
            return PetList(auth.token??'', auth.userId??'');
          }),
        ChangeNotifierProvider(
          create: (_) => DadosPet({})),
          
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(      
          colorScheme: 
          ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: Colors.deepOrange),
          canvasColor: Color.fromRGBO(33,57,98,1),
          fontFamily: 'OpenSans'
        ),
        routes: {
          '/': (ctx) => const AuthOrHomePage(),
          '/medicoes-screen-batimentos': (ctx) => const MedicoesScreenBatimentos(),
          '/medicoes-screen-temperatura': (ctx) => const MedicoesScreenTemperatura(),
          '/porte-screen': (ctx) => const PorteScreen(),
          '/home-screen': (ctx) => HomeScreen(),
          '/auth-screen': (ctx) => AuthScreen(),
          '/especie-screen': (ctx) => SelecionarEspecieScreen(),
          '/selecionar-pet-screen': (ctx) => SelecionarPetScreen(),
          '/nome-pet-screen': (ctx) => NomePetScreen(),
          },
      ),
    );
  }
}

