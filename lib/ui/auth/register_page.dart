import 'package:capstone_project_jti/provider/firebase_auth_methods.dart';
import 'package:capstone_project_jti/ui/auth/login_page.dart';
import 'package:capstone_project_jti/widgets/color_button.dart';
import 'package:capstone_project_jti/widgets/input_item.dart';
import 'package:capstone_project_jti/widgets/oauth_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = 'register-page';
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpUser() async {
    await context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/jti.png',
                width: 80,
              ),
              const Text(
                'Hallo, Daftarkan Akun Anda!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InputItem("Email", _emailController, false, context),
              const SizedBox(
                height: 25,
              ),
              InputItem("Password", _passwordController, true, context),
              const SizedBox(
                height: 25,
              ),
              colorButton(context, "Sign Up", signUpUser),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Atau Login dengan Google",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              OAuthButton(context, "asset/google.svg", "Google", 25, () {
                context.read<FirebaseAuthMethods>().signInWithGoogle(context);
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Sudah punya akun ?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: const Text(
                      " Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
