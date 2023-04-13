import 'package:flutter/material.dart';

import 'home.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final TextEditingController _codeController = TextEditingController();

  bool _isLoading = false;
  bool _isError = false;

  Future<void> _verifyCode() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    // For this example, we will simply wait for a few seconds to simulate the verification process.
    await Future.delayed(const Duration(seconds: 3));

    // For this example, we will simply show a message depending on whether the code is correct or not.
    final bool isCodeCorrect = _codeController.text == '';
    if (isCodeCorrect) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success!'),
          content:
              const Text('Your phone number has been verified successfully.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      setState(() => _isError = true);
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'We have sent you a verification code to your phone number.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Verification Code',
                  errorText:
                      _isError ? 'The code you entered is incorrect.' : null,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _verifyCode,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
