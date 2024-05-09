// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/shared/widget/custom_form_fuild.dart';
import 'package:project/views/auth/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String userName = '';
  final String email = '';
  final String password = '';

  void registerUser() {
    if (formKey.currentState!.validate()) {
      // do something
    } else {
      // do something
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Bienvenido\nPor favor, registra tus datos para continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: AssetImage('assets/icons/user.png'),
                ),
                SizedBox(height: 30),
                CustomFormField(
                  labelText: "Nombre", 
                  prefixIcon: Icons.person
                ),
                SizedBox(height: 16),
                CustomFormField(
                  labelText: "Correo electrónico", 
                  prefixIcon: Icons.email
                ),
                SizedBox(height: 16),
                CustomFormField(
                  labelText: "Contraseña", 
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                _RegisterButton(
                  onTap: registerUser,
                ),
                SizedBox(height: 20),
                _SignInText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  final Function onTap;
  const _RegisterButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.all(10), 
        child: Center(
          child: Text(
            'Registrarse',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInText extends StatelessWidget {
  final BuildContext context;
  const _SignInText(this.context);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black), 
            children: const <TextSpan>[
              TextSpan(text: 'Ya tienes cuenta? '), 
              TextSpan(
                text: 'Logueate',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold) 
              ),
            ],
          ),
        ),
      ),
    );
  }
}

