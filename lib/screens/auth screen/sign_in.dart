import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/auth%20screen/login.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth inistance = FirebaseAuth.instance;

  late UserCredential userCredential;

  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nameUser = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _nameUser.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Account"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Icon(
                    Icons.restaurant,
                    size: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Enter your Email"),
                    controller: _email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: "Enter your Password"),
                    controller: _password,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginscreen(),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("login"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          ),
                        );
                        userCredential =
                            await inistance.createUserWithEmailAndPassword(
                                email: _email.text.trim(),
                                password: _password.text.trim());
                        final snackBar = SnackBar(
                          content: const Text("success Sign in"),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          Navigator.pop(context);
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "invalid-email") {
                          Navigator.pop(context);
                          final snackBar = SnackBar(
                            content: const Text("Invalid Email"),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == "email-already-in-use") {
                          Navigator.pop(context);
                          final snackBar = SnackBar(
                            content: const Text("Email is Already Used"),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == "weak-password" ||
                            _password.text.isEmpty) {
                          Navigator.pop(context);
                          final snackBar = SnackBar(
                            content: const Text("Weak Password"),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == "operation-not-allowed") {
                          Navigator.pop(context);
                          final snackBar = SnackBar(
                            content:
                                const Text("Email and password not vailed"),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    child: const Text("Sign In"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
