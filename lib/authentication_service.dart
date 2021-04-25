import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String id;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  String getVerificationId() {
    debugPrint(id);
    return id;
  }

  Future<void> phoneVerification( String phoneNumber, BuildContext context, List controllers ) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          registerUser(phoneAuthCredential, context, controllers);
        },
        verificationFailed: (verificationFailed) async {
          print(verificationFailed.message);
        },
        codeSent: (verificationId, resendingToken) async {
          id = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) async {
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
  
  Future<void> registerUser( PhoneAuthCredential phoneAuthCredential, BuildContext context, List controllers ) async {
    try {
      await _firebaseAuth.signInWithCredential(phoneAuthCredential)
        .then((user) async => {
          if(_firebaseAuth.currentUser != null) {
            print("SIGNED IN"),
            await _firestore
              .collection('users')
              .doc( _firebaseAuth.currentUser.uid )
              .set(
                {
                  'nickname' : controllers[1].text.trim(),
                  'street' : controllers[2].text.trim() + " " + 
                             controllers[3].text.trim(), 
                  'municipality' : controllers[4].text.trim(),
                  'province' : controllers[5].text.trim(),
                } 
              )
              .then((value) => print("User added}"))
              .catchError((error) => print("Failed to add user: $error")),
            Navigator.popUntil(context, ModalRoute.withName('/')),
          }
        });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> signOut() async {
    print("SIGNED OUT");
    await _firebaseAuth.signOut();
  }


  Future<void> emailSignIn({String email, String password, BuildContext context}) async { 
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print("SIGNED IN");
    } on FirebaseAuthException catch (e) {
      print (e.message);
    }
  }
} 