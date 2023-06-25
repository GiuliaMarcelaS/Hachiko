import 'package:flutter/material.dart';

import '../componentes/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(79, 112,168, 1),
      body: Stack(
        children: [
          Container(
                  child: ClipRRect(borderRadius: BorderRadius.circular(200),child: Image.asset('assets/images/logo.png',fit: BoxFit.fill,)),
                  height: 250,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 50),
                ),
          // Container(
          //   decoration: const BoxDecoration(),
          // ),
          SizedBox(
           // width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthForm(),
              ]),
          )
        ],
      ),
    );
  }
}