import 'package:capstone_project_jti/page_view.dart';
import 'package:capstone_project_jti/utils/show_snackbar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser;

  // State Persistent
  Stream<User> get authState => FirebaseAuth.instance.authStateChanges();

  // Email Sign Up
  Future<void> signUpWithEmail({
    String username,
    String email,
    String password,
    BuildContext context,
  }) async {
    if (password.isNotEmpty && email.isNotEmpty && username.isNotEmpty) {
      try {
        await _auth
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then(
              (auth) => {
                auth.user.updateDisplayName(username),
              },
            );

        await sendEmailVerification(context);

        await _auth.signOut();

        Navigator.pop(context);
        showSnackBar(context, 'Please Verify Your Email First');
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message);
      }
    } else {
      showSnackBar(context, 'All inputs must be filled');
    }
  }

  // Email Sign In
  Future<void> loginWithEmail({
    String email,
    String password,
    BuildContext context,
  }) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((auth) => {
                if (auth.user.emailVerified == false)
                  {
                    _auth.signOut(),
                    showSnackBar(context, 'Please Verify Your Email'),
                  }
                else
                  {
                    Navigator.pushReplacementNamed(
                        context, MyPageView.routeName)
                  }
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, e.message);
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, e.message);
      } else {
        showSnackBar(context, e.message);
      }
    }
  }

  // Send Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }
}
