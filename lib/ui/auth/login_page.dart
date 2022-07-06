import 'package:capstone_project_jti/page_view.dart';
import 'package:capstone_project_jti/provider/firebase_auth_methods.dart';
import 'package:capstone_project_jti/ui/auth/register_page.dart';
import 'package:capstone_project_jti/widgets/color_button.dart';
import 'package:capstone_project_jti/widgets/input_item.dart';
import 'package:capstone_project_jti/widgets/oauth_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static String routeName = 'login-page';
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                'Hallo, Masuk ke Akun Anda!',
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
              colorButton(context, "Sign In", () async {
                await context.read<FirebaseAuthMethods>().loginWithEmail(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context,
                    );
              }),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Belum punya akun ?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.brown),
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
