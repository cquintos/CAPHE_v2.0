import 'package:flutter/material.dart';

class RegisterFormSection extends StatefulWidget {
  @override
  _RegisterFormSectionState createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();
    final _passwordController = TextEditingController();
    final _streetController = TextEditingController();
    final _cityController = TextEditingController();
    final _provinceController = TextEditingController();
    double deviceHeight = MediaQuery.of(context).size.height;

    return Wrap(
      children: [
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
          controller: _passwordController,
          keyboardType: TextInputType.text,
          style: TextStyle( color: Colors.white, ),
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon( Icons.lock, color: Colors.white, ),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "Password", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
            suffixIcon: IconButton( onPressed: _passwordController.clear, icon: Icon(Icons.clear), ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle( color: Colors.white, ),
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon( Icons.lock, color: Colors.transparent, ),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "Confirm Password", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
            suffixIcon: IconButton( onPressed: _passwordController.clear, icon: Icon(Icons.clear), ),
          ),
        ),
        SizedBox(height:deviceHeight*0.1),
        TextFormField(
          controller: _streetController,
          keyboardType: TextInputType.text,
          style: TextStyle( color: Colors.white, ),
          decoration: InputDecoration(
            icon: Icon( Icons.location_pin , color: Colors.white, ),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "Street", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
            suffixIcon: IconButton( onPressed: _streetController.clear, icon: Icon(Icons.clear), ),
          ),
        ),
        TextFormField(
          controller: _cityController,
          keyboardType: TextInputType.text,
          style: TextStyle( color: Colors.white, ),
          decoration: InputDecoration(
            icon: Icon( Icons.location_city, color: Colors.transparent, ),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "City", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
            suffixIcon: IconButton( onPressed: _cityController.clear, icon: Icon(Icons.clear), ),
          ),
        ),
        TextFormField(
          controller: _provinceController,
          keyboardType: TextInputType.text,
          style: TextStyle( color: Colors.white, ),
          decoration: InputDecoration(
            icon: Icon( Icons.location_city, color: Colors.transparent, ),
            enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white) ),
            labelText: "Province", labelStyle: TextStyle(color: Colors.white, fontSize: 15),
            suffixIcon: IconButton( onPressed: _provinceController.clear, icon: Icon(Icons.clear), ),
          ),
        ),
      ]
    );
  }
}