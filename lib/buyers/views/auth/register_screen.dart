// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/buyers/controllers/auth.controller.dart';
import 'package:project/shared/widget/custom_form_fuild.dart';
import 'package:project/buyers/views/auth/login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();

  late String userName = '';
  late String email = '';
  late String password = '';
  bool isLoading = false;

  void registerUser() async {
    startLoading();

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final String response = await performRegistration();

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

  Future<String> performRegistration() async {
    return await _authController
        .registerUser(email, password, userName)
        .whenComplete(() {
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
          title: Text('Cuenta creada'),
          content: Text('Tu cuenta ha sido creada exitosamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      prefixIcon: Icons.person,
                      onSaved: (value) => userName = value ?? '',
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      labelText: "Correo electrónico",
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => email = value ?? '',
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      labelText: "Contraseña",
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      onSaved: (value) => password = value ?? '',
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
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
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
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
