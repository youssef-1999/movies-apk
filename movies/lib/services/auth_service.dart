import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> logout() async {
        await GoogleSignIn.instance.signOut(); // so the account picker shows again next time

    await _auth.signOut();
  }
   bool _googleInitialized = false;

  Future<UserCredential?> signInWithGoogle() async {
    final google = GoogleSignIn.instance;
    if (!_googleInitialized) {
      await google.initialize(
        // Web client ID (client_type 3) from google-services.json
        serverClientId:
            '168533500993-iipise1g6cr7pf8cffdbd03eki91mguk.apps.googleusercontent.com',
      );
      _googleInitialized = true;
    }

    try {
      final GoogleSignInAccount account = await google.authenticate();
      final idToken = account.authentication.idToken;
      debugPrint('Google account: ${account.email}, idToken null? ${idToken == null}');
      if (idToken == null) {
        throw Exception('Google returned no idToken (check serverClientId / SHA-1)');
      }

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      debugPrint('Calling Firebase signInWithCredential...');
      final result = await _auth
          .signInWithCredential(credential)
          .timeout(const Duration(seconds: 20));
      debugPrint('Firebase sign-in OK: uid=${result.user?.uid}');
      return result;
    } on GoogleSignInException catch (e) {
      // On Android, config problems are often reported as "canceled", so log it.
      debugPrint('GoogleSignInException: code=${e.code}, description=${e.description}');
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: code=${e.code}, message=${e.message}');
      rethrow;
    }
  }
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  Future <void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);

  }
  Future <void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

}