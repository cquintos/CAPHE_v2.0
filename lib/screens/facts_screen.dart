import 'package:flutter/material.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({Key key}) : super(key: key);

  @override
  _FactsScreenState createState() => _FactsScreenState();
}

Widget _getContent(_value) {
  Widget content;
  switch (_value) {
    case 1: return Container (
              child: Text("Coffea Canephora, or Coffea robusta, is a coffee plant that is most commonly known to grow Robusta coffee beans. It is a species of coffee belonging to Rubiaceae (Madder family). Though widely known as Coffea robusta, the plant is scientifically identified as Coffea canephora, which has two main varieties, robusta and nganda. The plant has its origins in the northern forests of Ethiopia and now grows indigenously throughout western and central sub-Saharan Africa (Liberia – Tanzania – Angola). Some of the popular common names of the plant are Congo coffee, Congo coffeetree, Robusta coffee and robusta coffee tree."),
    );
      break;
    case 2: return Container (
              child: Text("In the 1890s, the Liberica coffee plant was transported and cultivated in other parts of the world, including the Philippines and Indonesia, following a mass die-off of Arabica plants around the world due to a disease known as “coffee rust”.Caused by the fungus Hemileia vastatrix, the disease gets its name from the light brown and powdery appearance of the fungus, which looks like iron rust. Once infected with the fungus, the plant eventually loses all its leaves, as well as its ability to produce beans. Compared to the Arabica coffee plant, the Liberica plant is hardier, as it is adaptable to hot climates, resistant to pests and disease, and can grow at low altitudes. However, since the coffee rust outbreak in the 19th century, the Arabica variety has recovered and now holds the crown as the most prevalent coffee bean in the market. Today, it is Liberica plants that are considered endangered due to its low rates of cultivation."),
    );
      break;
    case 3: return Container (
              child: Text("Coffea arabica, also known as the Arabian coffee, coffee shrub of Arabia, mountain coffee or arabica coffee, is a species of Coffea. It is believed to be the first species of coffee to be cultivated, and is the dominant cultivar, representing about 60% of global production. "),
    );
      break;
    case 4: return Container (
              child: Text("Excelsa plants are mainly found in Southeast Asia, and the beans are mostly used as blending coffee. Excelsa has a unique taste profile, somewhat mysterious; it has a flavor of both light roast and dark roast coffee—feels like tart, fruity, and somehow dark."),
    );
      break;

    default:
    return Container (
              child: Text("Coffea Canephora, or Coffea robusta, is a coffee plant that is most commonly known to grow Robusta coffee beans. It is a species of coffee belonging to Rubiaceae (Madder family). Though widely known as Coffea robusta, the plant is scientifically identified as Coffea canephora, which has two main varieties, robusta and nganda. The plant has its origins in the northern forests of Ethiopia and now grows indigenously throughout western and central sub-Saharan Africa (Liberia – Tanzania – Angola). Some of the popular common names of the plant are Congo coffee, Congo coffeetree, Robusta coffee and robusta coffee tree."),
    );
  }
}


class _FactsScreenState extends State<FactsScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.1),
          child:  Column(
            children: [
              SizedBox(height:10),
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
              _getContent(_value)
            ],
          ),
        ),
      ],
    );
  }
}