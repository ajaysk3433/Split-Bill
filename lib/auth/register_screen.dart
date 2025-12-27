import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  void registerUser() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailAddressController.text,
            password: _passwordController.text,
          );
      await credential.user?.updateDisplayName(_userNameController.text);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User registered successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacementNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The password provided is too weak.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The account already exists for that email.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                Text("Create an account to continue!"),
                SizedBox(height: 15),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _emailAddressController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue[600]),
                    ),
                    onPressed: registerUser,

                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey, width: 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
