// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/shared/widget/custom_form_fuild.dart';
import 'package:project/views/auth/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                'Bienvenido\nPor favor, inicia sesión para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/Illustration.png', height: 280),
              SizedBox(height: 20),
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
              _LoginButton(),
              SizedBox(height: 20),
              _SignUpText(context),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Acción al presionar
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.all(10), 
        child: Center(
          child: Text(
            'Iniciar sesión',
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

class _SignUpText extends StatelessWidget {
  final BuildContext context;
  _SignUpText(this.context);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black), 
            children: <TextSpan>[
              TextSpan(text: '¿No tienes cuenta? '), 
              TextSpan(
                text: 'Regístrate',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold) 
              ),
            ],
          ),
        ),
      ),
    );
  }
}

