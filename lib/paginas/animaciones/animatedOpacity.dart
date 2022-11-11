import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class AOpacity extends StatefulWidget {
  final imgOpacity;
  const AOpacity({Key? key, required this.imgOpacity}) : super(key: key);

  @override
  State<AOpacity> createState() => _AOpacityState();
}

class _AOpacityState extends State<AOpacity> {
  double width = 300;
  double height = 500;
  double opacity = 0.2;

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
            opacity = opacity == 0.2 ? 1.0 : 0.2;
          });
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: AnimatedOpacity(
                      child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.imgOpacity),
                                fit: BoxFit.cover)),
                      ),
                      opacity: opacity,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceInOut,
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
            "ANIMATED OPACITY",
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
