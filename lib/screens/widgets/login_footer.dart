import 'package:flutter/material.dart';
import '../about_screen.dart';

class LoginFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(child: Text("Powered by:"), alignment: Alignment.centerLeft, margin:EdgeInsets.only(bottom:10),),
            Stack(
              children: [
                Container(
                  height: deviceHeight*0.06,
                  decoration: BoxDecoration(
                    image: DecorationImage( alignment: Alignment.topLeft, image: AssetImage("assets/dost-pcaarrd-uplb.png"), fit: BoxFit.fitHeight, )
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon( Icons.help, color: Colors.green.shade800, size: 50, ), 
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen())); },
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomLeft,
                    image: AssetImage("assets/header_green.png"),
                    fit: BoxFit.contain,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}