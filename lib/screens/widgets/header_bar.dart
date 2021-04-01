import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final Text text;

  const HeaderBar({Key key, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          this.text,
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: deviceWidth*0.4,
                height: deviceHeight*0.04,
                decoration: BoxDecoration(
                  image: DecorationImage( 
                    alignment: Alignment.bottomRight, 
                    image: AssetImage("assets/dost-pcaarrd-uplb.png"), 
                    fit: BoxFit.fitHeight, 
                  )
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight); 
}
