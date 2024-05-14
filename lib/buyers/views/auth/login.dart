// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/buyers/views/controllers/auth.controller.dart';
import 'package:project/shared/widget/custom_form_fuild.dart';
import 'package:project/buyers/views/auth/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email = '';
  late String password = '';
  bool isLoading = false;

  void loginUser() async {
    startLoading();

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final String response = await performLogin();

      if (!mounted) return;
      if (response == 'success') {
        showSuccessDialog();
      } else {
        showErrorSnackBar(response);
      }
    } else {
      showValidationSnackBar();
    }

    stopLoading();
  }

  void startLoading() {
    setState(() {
      isLoading = true;
      FocusScope.of(context).unfocus();
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  Future<String> performLogin() async {
    return await _authController.loginUser(email, password).whenComplete(() {
      setState(() {
        formKey.currentState!.reset();
      });
    });
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Inicio de sesión exitoso'),
          content: Text('¡Bienvenido de nuevo!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showValidationSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Por favor, rellena todos los campos'),
      ),
    );
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
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => email = value ?? ''),
                SizedBox(height: 16),
                CustomFormField(
                    labelText: "Contraseña",
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    onSaved: (value) => password = value ?? ''),
                SizedBox(height: 20),
                _LoginButton(),
                SizedBox(height: 20),
                _SignUpText(context),
              ],
            ),
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
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}