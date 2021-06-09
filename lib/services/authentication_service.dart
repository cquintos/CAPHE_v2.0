import 'package:caphe_v2/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signInEmail({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future registerEmail({String email, String password, String nickname, String municipality, String province}) async {
    try {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      
      await DatabaseService().updateUserData(nickname, municipality, province);
      return user;
    } on FirebaseAuthException catch (e) {
      print("Auth Error " + e.message);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
      print("SIGNED OUT");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

}























  // String getVerificationId() {
  //   debugPrint(id);
  //   return id;
  // }

  // Future phoneVerification( String phoneNumber, BuildContext context, List controllers ) async {
  //   try {
  //     await _firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: (phoneAuthCredential) async {
  //         registerUser(phoneAuthCredential, context, controllers);
  //       },
  //       verificationFailed: (verificationFailed) async {
  //         print(verificationFailed.message);
  //       },
  //       codeSent: (verificationId, resendingToken) async {
  //         return id = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) async {
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //   }
  // }
  
  // Future<void> registerUser( PhoneAuthCredential phoneAuthCredential, BuildContext context, List controllers ) async {
  //   try {
  //     await _firebaseAuth.signInWithCredential(phoneAuthCredential)
  //       .then((user) async => {
  //         if(_firebaseAuth.currentUser != null) {
  //           print("SIGNED IN"),
  //           await _firestore
  //             .collection('users')
  //             .doc( _firebaseAuth.currentUser.uid )
  //             .set(
  //               {
  //                 'nickname' : controllers[1].text.trim(),
  //                 'street' : controllers[2].text.trim() + " " + 
  //                            controllers[3].text.trim(), 
  //                 'municipality' : controllers[4].text.trim(),
  //                 'province' : controllers[5].text.trim(),
  //               } 
  //             )
  //             .then((value) => print("User added}"))
  //             .catchError((error) => print("Failed to add user: $error")),
  //           Navigator.popUntil(context, ModalRoute.withName('/')),
  //         }
  //       });
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //   }
  // }

  // Future<void> signOut() async {
  //   print("SIGNED OUT");
  //   await _firebaseAuth.signOut();
  // }


  // Future<void> emailSignIn({String email, String password, BuildContext context}) async { 
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //     print("SIGNED IN");
  //   } on FirebaseAuthException catch (e) {
  //     print (e.message);
  //   }
  // }
// } 