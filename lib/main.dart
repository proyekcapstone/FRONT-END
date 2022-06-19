import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/firebase_options.dart';
import 'package:capstone_project_jti/page_view.dart';
import 'package:capstone_project_jti/provider/culinary_provider.dart';
import 'package:capstone_project_jti/provider/destination_provider.dart';
import 'package:capstone_project_jti/provider/firebase_auth_methods.dart';
import 'package:capstone_project_jti/provider/hotel_provider.dart';
import 'package:capstone_project_jti/ui/auth/login_page.dart';
import 'package:capstone_project_jti/ui/auth/register_page.dart';
import 'package:capstone_project_jti/ui/home_page.dart';
//import 'package:capstone_project_jti/ui/detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/culinary_source.dart';
import 'api/destination_source.dart';
import 'api/hotel_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider<DestinationProvider>(
          create: (_) => DestinationProvider(destinationSource: DestinationSource()),
        ),
        ChangeNotifierProvider<HotelProvider>(
          create: (_) => HotelProvider(hotelSource: HotelSource()),
        ),
        ChangeNotifierProvider<CulinaryProvider>(
          create: (_) => CulinaryProvider(culinarySource: CulinarySource()),
        ),
      ],
      child: MaterialApp(
        title: 'Jogja Travel Information',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: myTextTheme,
          primaryColor: primaryColor,
        ),
        home: const HomePage(),
        //const AuthWrapper(),
        routes: {
          RegisterPage.routeName: (context) => const RegisterPage(),
          myPageView.routeName: (context) => const myPageView(),
          LoginPage.routeName: (context) => const LoginPage()
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return const myPageView();
    }
    return const LoginPage();
  }
}
