import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:caphe_v2/authentication_service.dart';

class RegisterRecapButtons extends StatelessWidget {
  RegisterRecapButtons( this.controllers, {Key key}) : super(key: key);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; 
  final List<TextEditingController> controllers;
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '+63'+(int.parse(controllers[0].text).toString());
    String verificationId;
    GlobalKey<FormState> otpFormKey;
    PhoneAuthCredential phoneAuthCredential;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () async {
                context.read<AuthenticationService>()
                  .phoneVerification(
                    phoneNumber,
                    context,
                    controllers
                  );
                verificationId = context
                  .read<AuthenticationService>()
                  .getVerificationId();
                debugPrint(verificationId);

                return showDialog<String> (
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                
                    return StatefulBuilder(
                      builder: (context, setState) {
                
                        return AlertDialog(
                          content: Container(
                            height: MediaQuery.of(context).size.height*.3,
                            width: MediaQuery.of(context).size.width*.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget> [
                                Form(
                                  key: otpFormKey,
                                  child: TextFormField(
                                    controller: otpController,
                                    decoration: InputDecoration( hintText: "Enter OTP", ),
                                    validator: ( String value ) {
                                      if(value.isEmpty) 
                                        return 'Please enter you OTP';
                                    }
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        phoneAuthCredential = PhoneAuthProvider.credential(
                                          verificationId: verificationId, 
                                          smsCode: otpController.text
                                        );
                                        context.read<AuthenticationService>()
                                          .registerUser( phoneAuthCredential, context, controllers);
                                      },
                                      child: Text("VERIFY"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        verificationId = null;
                                        otpController.clear();
                                        Navigator.of(context, rootNavigator: true).pop();
                                      },  
                                      style: ElevatedButton.styleFrom( primary: Colors.red, onPrimary: Colors.white, ),
                                      child: Text("CANCEL"),
                                    )
                                  ]
                                )
                              ],
                            ),
                          )
                        );
                      }
                    );
                  }
                );
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
              onPressed: () { Navigator.of(context, rootNavigator: true).pop(); },
              child: Text("CANCEL", textAlign: TextAlign.center),
              style: OutlinedButton.styleFrom( primary: Colors.red, side: BorderSide(color: Colors.red), ),
            ),
          ),
        ),
      ],
    );
  }
}