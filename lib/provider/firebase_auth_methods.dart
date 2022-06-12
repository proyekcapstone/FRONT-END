import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:capstone_project_jti/utils/show_snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser;

  // State Persistent
  Stream<User> get authState => FirebaseAuth.instance.authStateChanges();

  // Email Sign Up
  Future<void> signUpWithEmail({
    String email,
    String password,
    BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await sendEmailVerification(context);
      Navigator.pop(context);
      showSnackBar(context, 'Registrasi Berhasil!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  // Email Sign In
  Future<void> loginWithEmail({
    String email,
    String password,
    BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // if (!(_auth.currentUser.emailVerified)) {
      //   showSnackBar(context, 'Please Verify Email Verification!');
      // }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
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
        UserCredential userCredential =
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
