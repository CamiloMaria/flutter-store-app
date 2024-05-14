import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to register new user
  Future<String> registerUser(
      String email, String password, String name) async {
    try {
      final userCredentail = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await userCredentail.user!.updateDisplayName(name);
      await saveUserData(name, email);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not valid.';
      } else {
        return e.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  // Function to login user
  Future<String> loginUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not valid.';
      } else {
        return e.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  // Function to logout user
  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }

  // Save user data to firestore
  Future<void> saveUserData(String name, String email) async {
    await _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'name': name,
      'email': email,
    });
  }
}
