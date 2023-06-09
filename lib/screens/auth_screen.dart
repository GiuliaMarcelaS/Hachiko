import 'package:flutter/material.dart';

import '../componentes/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Hachiko',
                  style: TextStyle(
                    fontSize: 45
                  ),
                ),
                AuthForm(),
              ]),
          )
        ],
      ),
    );
  }
}