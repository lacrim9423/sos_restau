import 'package:flutter/material.dart';

import 'singup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(
        primaryColor: Colors.orange[200], // Set primary color to light orange
        scaffoldBackgroundColor: Colors.white, // Set background color to white
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange[200], // Set button color to light orange
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Set button border radius to 20
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0, // Remove app bar shadow
          backgroundColor:
              Colors.white, // Set app bar background color to white
          iconTheme: IconThemeData(
            color: Colors.black, // Set app bar icon color to black
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail / N° de téléphone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Set text field border radius to 20
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de Passe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Set text field border radius to 20
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.00), // Reduce button height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Set button border radius to 20
                ),
              ),
              child: Container(
                width: double.infinity, // Make button fill entire width
                alignment: Alignment.center,
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpNamePage()),
                );
              },
              child: const Text("Vous n'avez pas de compte? Enregistrez"),
            ),
          ],
        ),
      ),
    );
  }
}
