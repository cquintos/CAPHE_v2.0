import 'package:caphe_v2/models/farm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'card_layout.dart';
import 'empty_card_layout.dart';
import 'home_chart.dart';

class SlideBuilder extends StatefulWidget {

  @override
  _SlideBuilderState createState() => _SlideBuilderState();
}

class _SlideBuilderState extends State<SlideBuilder> {
  int currentCard = 0;

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    int count = farms.length ?? 0;
    
    void _onItemFocus(int index) {
      setState(() {
        currentCard = index;
        print(currentCard);
      }); 
    }

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: count == 0 ? Container() 
            : HomeChart(currentCard)
        ),
        Expanded(
          flex: 1,
          child: ScrollSnapList(
            onItemFocus: _onItemFocus,
            itemSize: MediaQuery.of(context).size.width*.9,
            itemBuilder: _buildListItem,
            itemCount: count == 0 ? 1 : count,
          )
        ),
      ]
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final farms = Provider.of<List<Farm>>(context);
    
    index = index+1; 
    return Container(
      width: MediaQuery.of(context).size.width*.9,
      child: Center( 
        child: farms.length == 0 
        ? Column (
          children: [ EmptyCardLayout() ],
        ) 
        : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ CardLayout(index-1), ],
        ),
      ),
    );
  }
}