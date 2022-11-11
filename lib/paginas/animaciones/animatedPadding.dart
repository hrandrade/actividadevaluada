import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class APadding extends StatefulWidget {
  final imgPadding;
  const APadding({Key? key, required this.imgPadding}) : super(key: key);

  @override
  State<APadding> createState() => _APaddingState();
}

class _APaddingState extends State<APadding> {
  double width = 200;
  double height = 100;
  double width2 = 200;
  double height2 = 300;
  double padValue = 0;

  _updatePadding(double value) => setState(() => padValue = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //color de fondo
      body: spoBody(),
      appBar: appSpot(),
    );
  }

  Widget spoBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          setState(() {
            padValue = padValue == 0 ? 25 : 0;
          });
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: AnimatedPadding(
                      padding: EdgeInsets.only(left: padValue),
                      child: Container(
                        width: width2,
                        height: height2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.imgPadding),
                                fit: BoxFit.cover)),
                      ),
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: AnimatedPadding(
                      padding: EdgeInsets.only(right: padValue),
                      child: Container(
                        width: width2,
                        height: height2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.imgPadding),
                                fit: BoxFit.cover)),
                      ),
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }

  appSpot() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0,
          ),
          Text(
            "ANIMATED PADDING",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
              icon: Icon(
                FeatherIcons.moreVertical,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
