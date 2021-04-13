import 'package:caphe_v2/screens/widgets/login_background.dart';
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

    return Stack(
      children: [
        BackgroundSection(),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: 30),
            child: Column(
              children: [
                Text("Enter your details so we can reach you.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  style: TextStyle( color: Colors.white, ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone_android, color: Colors.white),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                    labelText: "Phone Number", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                    suffixIcon: IconButton( onPressed: _phoneController.clear, icon: Icon(Icons.clear), ), 
                  ),
                ),
                TextFormField(
                  controller: _userController,
                  keyboardType: TextInputType.text,
                  style: TextStyle( color: Colors.white, ),
                  decoration: InputDecoration(
                    icon: Icon( Icons.account_box_rounded, color: Colors.white, ),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                    labelText: "Name", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                    suffixIcon: IconButton( onPressed: _userController.clear, icon: Icon(Icons.clear), ),
                  ),
                ),
                // SizedBox(height:deviceHeight*0.1),
                // TextFormField(
                //   controller: _streetController,
                //   keyboardType: TextInputType.text,
                //   style: TextStyle( color: Colors.white, ),
                //   decoration: InputDecoration(
                //     icon: Icon( Icons.location_pin , color: Colors.white, ),
                //     enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                //     labelText: "Street", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                //     suffixIcon: IconButton( onPressed: _streetController.clear, icon: Icon(Icons.clear), ),
                //   ),
                // ),
                // TextFormField(
                //   controller: _cityController,
                //   keyboardType: TextInputType.text,
                //   style: TextStyle( color: Colors.white, ),
                //   decoration: InputDecoration(
                //     icon: Icon( Icons.location_city, color: Colors.transparent, ),
                //     enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                //     labelText: "City", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                //     suffixIcon: IconButton( onPressed: _cityController.clear, icon: Icon(Icons.clear), ),
                //   ),
                // ),
                TextFormField(
                  controller: _provinceController,
                  keyboardType: TextInputType.text,
                  style: TextStyle( color: Colors.white, ),
                  decoration: InputDecoration(
                    icon: Icon( Icons.location_pin, color: Colors.white, ),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
                    labelText: "Province", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                    suffixIcon: IconButton( onPressed: _provinceController.clear, icon: Icon(Icons.clear), ),
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
                      child: Text("CLEAR ALL"),
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
        ),
      ],
    );
  }
}