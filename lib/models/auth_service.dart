import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  final firebaseAuth = FirebaseAuth.instance;
  User? currentUser;
  bool loading = false;

  void showLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<bool> signUpUsingEmailPassword({
    required String email,
    required String pword,
    required void Function(String message) showSnackbar,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pword,
      );
      currentUser = userCredential.user;
      showSnackbar("Register Successfully");
      return currentUser != null;
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        showSnackbar("The password provided is too weak");
      } else if (err.code == "email-already-in-use") {
        showSnackbar("The account already exists for that email");
      }
      return false;
    } catch (err) {
      showSnackbar("Error !!");
      return false;
    }
  }

  Future<bool> signInUsingEmailPassword({
    required String email,
    required String pword,
    required void Function(String message) showSnackbar,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pword,
      );
      currentUser = userCredential.user;
      showSnackbar("Login Successful");
      return currentUser != null;
    } on FirebaseAuthException catch (err) {
      if (err.code == "user-not-found") {
        showSnackbar("User not found for that email");
      } else if (err.code == "wrong-password") {
        showSnackbar("Wrong Password");
      }
      return false;
    }
  }

  void logout() async {
    await firebaseAuth.signOut();
    currentUser = null;
    notifyListeners();
  }
}
