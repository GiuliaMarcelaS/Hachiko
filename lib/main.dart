import 'package:flutter/material.dart';
import 'package:hachiko/componentes/auth.dart';
import 'package:hachiko/componentes/calendario.dart';
import 'package:hachiko/componentes/dados_pet.dart';
import 'package:hachiko/componentes/lista_de_medicoes.dart';
import 'package:hachiko/componentes/pet.dart';
import 'package:hachiko/componentes/pet_list.dart';
import 'package:hachiko/screens/auth_or_home_screen.dart';
import 'package:hachiko/screens/auth_screen.dart';
import 'package:hachiko/screens/data_batimento_screen.dart';
import 'package:hachiko/screens/data_temperatura_screen.dart';
import 'package:hachiko/screens/home_screen.dart';
import 'package:hachiko/screens/medicoes_screen_batimentos.dart';
import 'package:hachiko/screens/medicoes_screen_temperatura.dart';
import 'package:hachiko/screens/nome_pet_screen.dart';
import 'package:hachiko/screens/porte_screen.dart';
import 'package:hachiko/screens/selecionar_especie_screen.dart';
import 'package:hachiko/screens/selecionar_pet_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

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
        ChangeNotifierProvider(
          create: (_) => Calendario()),
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
        ChangeNotifierProxyProvider<Auth,DadosPet>(
          create: (_) => DadosPet('','',{}),
          update:(ctx, auth, previous){
            return DadosPet(auth.token??'', auth.userId??'',{});
          }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(      
          colorScheme: 
          ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: Colors.deepOrange),
          canvasColor: const Color.fromRGBO(33,57,98,1),
          fontFamily: 'OpenSans'
        ),
        routes: {
          '/': (ctx) => const AuthOrHomePage(),
          '/medicoes-screen-batimentos': (ctx) => const MedicoesScreenBatimentos(),
          '/medicoes-screen-temperatura': (ctx) => const MedicoesScreenTemperatura(),
          '/porte-screen': (ctx) => const PorteScreen(),
          '/home-screen': (ctx) => const HomeScreen(),
          '/data-batimento-screen': (ctx) => const DataBatimentoScreen(),
          '/data-temperatura-screen': (ctx) => const DataTemperaturaScreen(),
          '/auth-screen': (ctx) => const AuthScreen(),
          '/especie-screen': (ctx) => const SelecionarEspecieScreen(),
          '/selecionar-pet-screen': (ctx) => const SelecionarPetScreen(),
          '/nome-pet-screen': (ctx) => const NomePetScreen(),
          },
      ),
    );
  }
}

