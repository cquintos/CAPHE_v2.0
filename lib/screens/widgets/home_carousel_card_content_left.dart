import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/routing_constants.dart';
import 'package:flutter/material.dart';

class HomeCarouselCardContentLeft extends StatefulWidget {
  const HomeCarouselCardContentLeft({Key key, this.title, this.data, this.isPressed}) : super(key: key);
  final String title;
  final String data;
  final bool  isPressed;

  @override
  _HomeCarouselCardContentLeftState createState() => _HomeCarouselCardContentLeftState(this.isPressed);
}

class _HomeCarouselCardContentLeftState extends State<HomeCarouselCardContentLeft> {
  bool isPressed;
  
  _HomeCarouselCardContentLeftState(this.isPressed);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 33; 

    return Container(
      child: Column(
        children: <Expanded> [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: AutoSizeText(
                this.widget.title,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                this.widget.data,
                maxLines: 1,
                textAlign: TextAlign.left,
                stepGranularity: 10,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              alignment: Alignment.topLeft,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <IconButton> [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed  = !isPressed;
                        });
                      },
                      icon: (isPressed)?Icon(Icons.notifications_active, size:iconSize, ):Icon(Icons.notifications, size:iconSize,),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.edit, size:iconSize, ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreenRoute);
                      }, 
                      icon: Icon(Icons.delete, size:iconSize, ),
                    )
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}