import 'package:caphe_v2/screens/widgets/register_container_button.dart';
import 'package:caphe_v2/screens/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({Key key}) : super(key: key);

  @override
  _RegisterContainerState createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(40),
      height: deviceHeight * 0.7,
      width: deviceWidth,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RegisterFormSection(),
            RegisterButtonSection()
          ],
        ),
      ),
    );
  }
}