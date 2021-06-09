import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/screens/home_screen/home_events.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'card_layout.dart';
import 'empty_card_layout.dart';
import 'progress_bar.dart';

class SlideBuilder extends StatefulWidget {
  final int start;
  const SlideBuilder(this.start, {Key key, }) : super(key: key);
  @override
  _SlideBuilderState createState() => _SlideBuilderState(this.start);
}


class _SlideBuilderState extends State<SlideBuilder> {
  int currentCard;
  final int start;
  _SlideBuilderState(this.start);

  @override
  void initState() { 
    super.initState();
    currentCard = start;
  }
    
  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    final cities = Provider.of<List<City>>(context);
    int count = farms == null ? 0 : farms.length;
    
    void _onItemFocus(int index) {
      setState(() {
        currentCard = (index - 1 == farms.length) && farms.length != 1
          ? index - 1
          : index;
      }); 
    }

    return farms == null || cities == null ? Loading()
    : Column(
      children: [
        Expanded(
          flex: 2,
          child: count == 0 ? Container() 
            : Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      currentCard == farms.length
                        ? farms[currentCard-1].currentStage.toUpperCase() + " STAGE"
                        : farms[currentCard].currentStage.toUpperCase() + " STAGE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                  currentCard == farms.length 
                    ? ProgressBar(currentCard-1)
                    : ProgressBar(currentCard)
                ]
              ),
            )
        ),
        Expanded(
          flex:1,
          child: count == 0 ? Container()
          : Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Swipe left or right to check your farms!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
        ),
        Expanded(
          flex: 6,
          child: ScrollSnapList(
            initialIndex: start.toDouble(),
            onItemFocus: _onItemFocus,
            itemSize: MediaQuery.of(context).size.width*.9,
            itemBuilder: _buildListItem,
            itemCount: count == 0 ? 1 : count,
          )
        ),
        Expanded(
          flex:1,
          child: count == 0 ? Container()
            : Center(
              child: Text(
                "Scoll Down to check all the important events!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
        ),
        Expanded(
          flex: 4,
          child: count == 0 
            ? Container()
            : currentCard == farms.length 
            ? HomeEvents(currentCard-1)
            : HomeEvents(currentCard),
        )
      ]
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final farms = Provider.of<List<Farm>>(context);
    
    index = index+1; 
    return Container(
      width: MediaQuery.of(context).size.width*.9,
      child: Center( 
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: farms.length == 0 
            ? [ EmptyCardLayout()] 
            : (farms.length == index-1)
            ? [ CardLayout(index-2), ]
            : [ CardLayout(index-1), ]
        )
      ),
    );
  }
}