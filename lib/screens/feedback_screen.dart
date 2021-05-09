import 'package:caphe_v2/shared/background.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();
    final _userController = TextEditingController();
    final _provinceController = TextEditingController();
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        children: [
          Background(),
          Center(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: 30),
                  child: Column(
                    children: [
                      Text("Your details like phone number and name will be sent to SARAI team.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height:deviceHeight*0.05),
                      Text("Feedback and Suggestions are highly appreciated: ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                      keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      SizedBox(height:deviceHeight*0.05),
                      Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              return showDialog<String> (
                                context: context,
                                barrierDismissible: true, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('SUBMITTED!'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text('Your suggestions or comments have been sent.'),
                                          Text('SARAI will surely take note of this. Thank you!'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              
                            },
                            child: Text("CLEAR"),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ]
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}