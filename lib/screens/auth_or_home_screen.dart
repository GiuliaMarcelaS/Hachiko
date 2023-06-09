// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:hachiko/screens/selecionar_especie_screen.dart';
import 'package:provider/provider.dart';

import '../componentes/auth.dart';
import 'auth_screen.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth? const SelecionarEspecieScreen(): const AuthScreen();
  }
}