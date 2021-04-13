import 'package:caphe_v2/classes/coffee_batch.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'home_carousel_card.dart';
import 'home_carousel_title.dart';

class CarouselSection extends StatefulWidget {
  CarouselSection({Key key}) : super(key: key);

  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  // List<CoffeeBatch> data = [];
  
  List<int> data = [1,2,3,4,5];

  // int _focusedIndex = 0;
  int index = 0; 

  void _onItemFocus(int index) {
    setState(() {
      // _focusedIndex = index;
    });
  }
  
  Widget _buildListItem(BuildContext context, int index) {
    double deviceWidth = MediaQuery.of(context).size.width;

    // if(true) print(index);
    index= index+1;
    return Container (
      width: deviceWidth*.9,
      child: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ CardSection(), ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    
    return Column (
      children: <Widget>[
        CarouselTitleSection(),
        // SizedBox(height:10),
        Expanded(
          child: ScrollSnapList(
            onItemFocus: _onItemFocus,
            itemSize: deviceWidth*.9, 
            itemBuilder: _buildListItem,
            itemCount: data.length,
          ),
         )
       ],
    );
  }
}