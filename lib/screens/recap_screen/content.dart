import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final List<TextEditingController> controllers;
  const Content( this.controllers, {Key key} ) : super(key: key);

   Widget _tile(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        tileColor: Colors.green.shade800,
        title: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500
        )),
        subtitle: Text(subtitle,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 15,
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Email", "Name", "Address", "Country"];
    List<IconData> leading = [Icons.phone_android, Icons.account_box_rounded, Icons.location_on, Icons.flag];

    return ListView(
      children: [
        for(int i=0; i<4; i++) 
          _tile(leading[i], i == 2 
            ? controllers[i].text + " " + controllers[i+1].text 
            : i < 3 ? this.controllers[i].text 
            : "Philippines", titles[i]
          )
      ],
    );
  }
}