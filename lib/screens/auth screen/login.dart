import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/auth%20screen/sign_in.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});
  static const String routNamed = "login screen";
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  FirebaseAuth inistance = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 0,
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
                    controller: _password,
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: "Enter your Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: testLogin,
                    child: const Text("login"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignIn();
                              },
                            ),
                          );
                        },
                      );
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

  Future<void> testLogin() async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        ),
      );
      await inistance.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      setState(() {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, TabView.routinaName);
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
      } else if (e.code == "user-disabled") {
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text("User Disabled"),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == "wrong-password" || _password.text.isEmpty) {
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text("Wrong Password"),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == "user-not-found") {
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text("User Not Found"),
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
  }
}
