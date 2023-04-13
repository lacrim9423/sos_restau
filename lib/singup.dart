// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';

import 'signup2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
      ),
      home: SignUpNamePage(),
    );
  }
}

class SignUpNamePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String? _nom;
  String? _prenom;
  String? _email;
  String? _phone;
  String? _motDePasse;

  SignUpNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enregistrer'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: Text("Première Etape"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nom = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre Prénom';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _prenom = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Numéro de Téléphone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre Numéro de Téléphoné';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mot de Passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre Mot de Passe';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _motDePasse = value;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Navigate to the confirmation screen and pass the collected data
                      Navigator.pushNamed(
                        context,
                        '/signup_confirmation',
                        arguments: {
                          'nom': _nom,
                          'prenom': _prenom,
                          'phoneNumber': _phone,
                          'email': _email,
                          'password': _motDePasse,
                        },
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupStep2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Continuer',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
