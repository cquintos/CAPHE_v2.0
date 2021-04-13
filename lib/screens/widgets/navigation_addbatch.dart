import 'package:flutter/material.dart';
import '../../routing_constants.dart';

class AddBatchDialog extends StatefulWidget {
  final String title;
  // final FirebaseAuth auth;

  const AddBatchDialog({Key key, this.title})
      : super(key: key);

  @override
  AddBatchDialogState createState() {
    return new AddBatchDialogState();
  }
}

class AddBatchDialogState extends State<AddBatchDialog> {
  final _batchNameController = TextEditingController();
  final _batchNumberController = TextEditingController();
  final _farmLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int _value = 1;

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Wrap(
                  children: [
                    TextFormField(
                      controller: _batchNameController,
                      keyboardType: TextInputType.number,
                      style: TextStyle( color: Colors.black, ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_box_rounded, color: Colors.black),
                        enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.black) ),
                        labelText: "Batch Name", labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                        suffixIcon: IconButton( onPressed: _batchNameController.clear, icon: Icon(Icons.clear), ), 
                      ),
                    ),
                    TextFormField(
                      controller: _batchNumberController,
                      keyboardType: TextInputType.text,
                      style: TextStyle( color: Colors.black, ),
                      decoration: InputDecoration(
                        icon: Icon( Icons.tag, color: Colors.black, ),
                        enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.black) ),
                        labelText: "Batch Number", labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                        suffixIcon: IconButton( onPressed: _batchNumberController.clear, icon: Icon(Icons.clear), ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("Select Variety: "),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("ROBUSTA"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("LIBERICA"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("ARABICA"),
                                value: 3
                              ),
                              DropdownMenuItem(
                                child: Text("EXCELSA"),
                                value: 4
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                _value = value;
                                print(_value);

                              });
                            }
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _farmLocationController,
                      keyboardType: TextInputType.text,
                      style: TextStyle( color: Colors.black, ),
                      decoration: InputDecoration(
                        icon: Icon( Icons.location_pin , color: Colors.black, ),
                        enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.black) ),
                        labelText: "Farm Location", labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                        suffixIcon: IconButton( onPressed: _farmLocationController.clear, icon: Icon(Icons.clear), ),
                      ),
                    ),
                  ]
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
                onPressed: () {
                  Navigator.pushNamed(context, TrackerScreenRoute);
                },
            ),
            Spacer(),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}






  // final _varietyController = TextEditingController();
  //   double deviceHeight = MediaQuery.of(context).size.height; 

                  // TextFormField(
                  //   controller: _varietyController,
                  //   keyboardType: TextInputType.text,
                  //   style: TextStyle( color: Colors.black, ),
                  //   decoration: InputDecoration(
                  //     icon: Icon( Icons.free_breakfast, color: Colors.transparent, ),
                  //     enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.black) ),
                  //     labelText: "Variety", labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  //     suffixIcon: IconButton( onPressed: _varietyController.clear, icon: Icon(Icons.clear), ),
                  //   ),
                  // ),
                  // SizedBox(height:deviceHeight*0.1),

  // final _addBatchKey = GlobalKey<FormState>();
  // int _selectedVariety = 0;

//  List<DropdownMenuItem<int>> varietyList = [];
// 
// 
// 
    // void loadGenderList() {
    // genderList = [];
    // genderList.add(new DropdownMenuItem(
      // child: new Text('Male'),
      // value: 0,
    // ));
    // genderList.add(new DropdownMenuItem(
      // child: new Text('Female'),
      // value: 1,
    // ));
    // genderList.add(new DropdownMenuItem(
      // child: new Text('Other'),
      // value: 2,
    // ));
  // }


  
//    @override
//   Widget build(BuildContext context) {
//     loadGenderList();
//     return Form(
//         key: _formKey,
//         child: new ListView(
//           children: getFormWidget(),
//         ));
//   }
  
//   List<Widget> getFormWidget() {
//     List<Widget> formWidget = new List();

//   formWidget.add(new DropdownButton(
//       hint: new Text('Select Gender'),
//       items: genderList,
//       value: _selectedGender,
//       onChanged: (value) {
//         setState(() {
//           _selectedGender = value;
//         });
//       },
//       isExpanded: true,
//     ));
    
//     return formWidget;
//   }
// }


 // final _resetKey = GlobalKey<FormState>();
  // final _resetEmailController = TextEditingController();
  // String _resetEmail;
  // bool _resetValidate = false;
  // 
// String validateEmail(String value) {
//   String pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regExp = new RegExp(pattern);
//   if (value.length == 0) {
//     return "Email is required";
//   } else if (!regExp.hasMatch(value)) {
//     return "Invalid Email";
//   } else {
//     return null;
//   }
// }
// 
// 
//   // StreamController<bool> rebuild = StreamController<bool>();

  // bool _sendResetEmail() {
  //   _resetEmail = _resetEmailController.text;

  //   if (_resetKey.currentState.validate()) {
  //     _resetKey.currentState.save();

  //     try {
  //       // You could consider using async/await here
  //       widget.auth.sendPasswordResetEmail(email: _resetEmail);
  //       return true;
  //     } catch (exception) {
  //       print(exception);
  //     }
  //   } else {
  //     setState(() {
  //       _resetValidate = true;
  //     });
  //     return false;
  //   }
  // }