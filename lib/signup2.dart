// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'profilepic.dart';

class SignupStep2 extends StatefulWidget {
  const SignupStep2({Key? key}) : super(key: key);

  @override
  _SignupStep2State createState() => _SignupStep2State();
}

class _SignupStep2State extends State<SignupStep2> {
  final _formKey = GlobalKey<FormState>();

  String? _restaurantName;
  String? _registryNumber;
  String? _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup - Step 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Nom du Restaurant',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your restaurant name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _restaurantName = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Numéro du Registre de Commerce',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your registry number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _registryNumber = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Adresse',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value;
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
                        'firstName': '',
                        'lastName': '',
                        'phoneNumber': '',
                        'email': '',
                        'password': '',
                        'restaurantName': _restaurantName!,
                        'registryNumber': _registryNumber!,
                        'address': _address!,
                      },
                    );
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
