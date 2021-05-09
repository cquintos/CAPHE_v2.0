// import 'package:caphe_v2/services/database_service.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:caphe_v2/services/authentication_service.dart';

class RegisterRecapButtons extends StatelessWidget {
  RegisterRecapButtons( this.controllers, {Key key}) : super(key: key);
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; 
  final List<TextEditingController> controllers;
  final otpController = TextEditingController();
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    // String phoneNumber = '+63'+(int.parse(controllers[0].text).toString());
    GlobalKey<FormState> otpFormKey;
    // String verificationId;
    // PhoneAuthCredential phoneAuthCredential;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: ElevatedButton(
              child: Text( "REGISTER", style: TextStyle( fontWeight: FontWeight.w800, ), ),
              style: ElevatedButton.styleFrom( primary: Colors.green.shade800, onPrimary: Colors.black, ),
              onPressed: () async {

                dynamic result = await _auth.registerEmail(
                  email: controllers[0].text,
                  password: controllers[1].text,
                  nickname: controllers[2].text,
                  street: controllers[3].text,
                  barangay: controllers[4].text,
                  municipality: controllers[5].text,
                  province: controllers[6].text  
                );
                if( result != null ) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                } else {
                  print("error");
                }
                // context.read<AuthenticationService>()
                //   .phoneVerification(
                //     phoneNumber,
                //     context,
                //     controllers
                //   );
                // verificationId = context
                //   .read<AuthenticationService>()
                //   .getVerificationId();
                // debugPrint(verificationId);

                // return showDialog<String> (
                //   context: context,
                //   barrierDismissible: false,
                //   builder: (BuildContext context) {
                
                //     return StatefulBuilder(
                //       builder: (context, setState) {
                
                //         return AlertDialog(
                //           content: Container(
                //             height: MediaQuery.of(context).size.height*.3,
                //             width: MediaQuery.of(context).size.width*.8,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //               children: <Widget> [
                //                 Form(
                //                   key: otpFormKey,
                //                   child: TextFormField(
                //                     controller: otpController,
                //                     decoration: InputDecoration( hintText: "Enter OTP", ),
                //                     validator: ( String value ) {
                //                       if(value.isEmpty) 
                //                         return 'Please enter you OTP';
                //                       return null;
                //                     }
                //                   ),
                //                 ),
                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     ElevatedButton(
                //                       child: Text("VERIFY"),
                //                       onPressed: () async {
                //                         dynamic result = await _auth.registerEmail(
                //                           email: controllers[0].text,
                //                           password: otpController.text,
                //                           nickname: controllers[1].text,
                //                           street: controllers[2].text,
                //                           barangay: controllers[3].text,
                //                           municipality: controllers[4].text,
                //                           province: controllers[5].text  
                //                         );
                //                         if( result != null ) {
                //                           Navigator.popUntil(context, ModalRoute.withName('/'));
                //                         } else {
                //                           print("error");
                //                         }
                //                         // phoneAuthCredential = PhoneAuthProvider.credential(
                //                         //   verificationId: verificationId, 
                //                         //   smsCode: otpController.text
                //                         // );
                //                         // context.read<AuthenticationService>()
                //                         //   .registerUser( phoneAuthCredential, context, controllers);
                //                       },
                //                     ),
                //                     ElevatedButton(
                //                       child: Text("CANCEL"),
                //                       style: ElevatedButton.styleFrom( primary: Colors.red, onPrimary: Colors.white, ),
                //                       onPressed: () {
                //                         // verificationId = null;
                //                         otpController.clear();
                //                         Navigator.of(context, rootNavigator: true).pop();
                //                       },  
                //                     )
                //                   ]
                //                 )
                //               ],
                //             ),
                //           )
                //         );
                //       }
                //     );
                //   }
                // );
              },
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