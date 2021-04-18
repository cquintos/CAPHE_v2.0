import 'package:caphe_v2/routing_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterRecapButtons extends StatefulWidget {
  final List<TextEditingController> controllers;

  RegisterRecapButtons( this.controllers, );  

  @override
  _RegisterRecapButtonsState createState() => _RegisterRecapButtonsState( controllers );
}

// void signInWithPhoneAuthCredential(
//     PhoneAuthCredential phoneAuthCredential) async {
//   setState(() {
//     showLoading = true;
//   });

//   try {
//     final authCredential =
//         await _auth.signInWithCredential(phoneAuthCredential);

//     setState(() {
//       showLoading = false;
//     });

//     if(authCredential?.user != null){
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
//     }

//   } on FirebaseAuthException catch (e) {
//     setState(() {
//       showLoading = false;
//     });

//     _scaffoldKey.currentState
//         .showSnackBar(SnackBar(content: Text(e.message)));
//   }
// }



class _RegisterRecapButtonsState extends State<RegisterRecapButtons> {
  List<TextEditingController> controllers;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  bool showLoading = false;
  final otpController = TextEditingController();

  _RegisterRecapButtonsState(this.controllers);
  
  void signInWithPhoneAuthCredential( PhoneAuthCredential userCredential ) async {
    try {
      final authCredential = await _auth.signInWithCredential(userCredential);
      if(authCredential.user != null) {
        print("SIGNED IN");
        Navigator.pushReplacementNamed(context, NavigationScreenRoute);
      }
    } on FirebaseAuthException catch (e) {
       print("error pows");
       print(e.message); 
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () async {
                ConfirmationResult confirmationResult = await _auth.signInWithPhoneNumber('+63'+(int.parse(controllers[0].text).toString()));
                return showDialog<String> (
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          content: Container(
                            height: MediaQuery.of(context).size.height*.6,
                            width: MediaQuery.of(context).size.width*.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget> [
                                Spacer(),
                                TextField(
                                  controller: otpController,
                                  decoration: InputDecoration(
                                    hintText: "Enter OTP",
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    verificationId = confirmationResult.verificationId;
                                    final AuthCredential credential = PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: otpController.text,
                                    );
                                    // UserCredential userCredential = await confirmationResult.confirm(otpController.text);

                                    signInWithPhoneAuthCredential(credential);
                                  },
                                  child: Text("VERIFY"),
                                ),
                                Spacer(),
                              ],
                            ),
                          )
                        );
                      }
                    );
                  }
                );

                // await _auth.signInWithPhoneNumber(
                //   phoneNumber: '+63'+(int.parse(controllers[0].text).toString()), 
                //   verificationCompleted: (phoneAuthCredential) async {
                //     signInWithPhoneAuthCredentail(phoneAuthCredential);
                //   }, 
                //   verificationFailed: (verificationFailed) async {
                //     // final snackBar = SnackBar ( content: Text(verificationFailed.message), );
                //     // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //     print(verificationFailed.message);
                //   }, 
                //   codeSent: (verificationId, resendinToken) async {
                //     this.verificationId = verificationId;
                //   },
                //   codeAutoRetrievalTimeout: (verificationId) async {}
                // );
              },
              child: Text( "SUBMIT", style: TextStyle( fontWeight: FontWeight.w800, ), ),
              style: ElevatedButton.styleFrom( primary: Colors.green.shade800, onPrimary: Colors.black, ),
            ),
          ),
        ),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: OutlinedButton(
              onPressed: () {
                 Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text("CANCEL", textAlign: TextAlign.center),
              style: OutlinedButton.styleFrom( primary: Colors.red, side: BorderSide(color: Colors.red), ),
            ),
          ),
        ),
      ],
    );
  }
}