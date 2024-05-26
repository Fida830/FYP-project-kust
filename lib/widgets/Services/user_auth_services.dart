import 'package:firebase_auth/firebase_auth.dart';

class UserAuthServices{
  ///create user
  Future<UserCredential> registerUser(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  /// login user
  Future<UserCredential> loginUser(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
  ///Reset Password
  Future resetPassword({required String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}