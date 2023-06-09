import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'auth_exception.dart';


enum AuthMode{signup, login}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData ={
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid){
      return;
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try{
    if(_isLogin()){
      await auth.login(_authData['email']!, _authData['password']!,);
    }else{
      await auth.signup(_authData['email']!, _authData['password']!,);
    }} on AuthException catch (error){
        _showErrorDialog(error.toString());
    } catch(error){
      _showErrorDialog('Ocorreu um erro inesperado!');
    }
    
    setState(() => _isLoading = false);
  }

  void _switchAuthMode(){
    setState(() {
      if(_isLogin()){
        _authMode = AuthMode.signup;
      } else{
        _authMode = AuthMode.login;
      }
    });
  }

  void _showErrorDialog(String msg){
    showDialog(context: context, builder: (ctx)=> AlertDialog(
      title: const Text('Ocorreu um erro'),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: (() => Navigator.of(context).pop()),
           child: const Text('Fechar'))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child:Column(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'E-mail'),
            keyboardType: TextInputType.emailAddress,
            onSaved: (email) => _authData['email'] = email ??'',
            // ignore: no_leading_underscores_for_local_identifiers
            validator: (_email) {
              final email = _email ?? '';
              if (email.trim().isEmpty|| !email.contains('@')){
                return 'Informe um e-mail válido';
                }
                return null;
              },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Senha'),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            controller: _passwordController,
            onSaved: (password) => _authData['password'] = password ??'',
            // ignore: no_leading_underscores_for_local_identifiers, body_might_complete_normally_nullable
            validator: (_password) {
              final password = _password ?? '';
              if (password.isEmpty||password.length < 5){
                return 'Informe uma senha válida';
              }
            },
          ),
          if(_isSignup())
           TextFormField(
            decoration: const InputDecoration(labelText: 'Confirmar Senha'),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
           // onSaved: (password) => _authData['password'] = password ??'',
            validator: _isLogin() ? null
            // ignore: no_leading_underscores_for_local_identifiers
            :(_password) {
              final password = _password ?? '';
              if(password != _passwordController.text){
                return 'Senhas informadas não conferem.';
              }
              return null;
            },
          ),
          const SizedBox(height: 20,),
          if(_isLoading)
          const CircularProgressIndicator()
          else
          ElevatedButton(
            onPressed: _submit, 
            child: Text(
              _authMode == AuthMode.login? 'ENTRAR': 'REGISTRAR',
            )),
            //Spacer(),
            TextButton(
              onPressed: _switchAuthMode, 
              child: Text(
                _isLogin() ? 'REGISTRAR': 'JÁ POSSUI CONTA?'
              ))
        ],) ),
    );
  }
}