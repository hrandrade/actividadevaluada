import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class AContainer extends StatefulWidget {
  final imgContainer;
  const AContainer({Key? key, required this.imgContainer}) : super(key: key);

  @override
  State<AContainer> createState() => _AContainerState();
}

class _AContainerState extends State<AContainer> {
  double width = 500;
  double height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 0, 36), //color de fondo
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
            width = width == 500 ? 200 : 500;
            height = height == 200 ? 500 : 200;
          });
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: AnimatedContainer(
                      width: width,
                      height: height,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.imgContainer),
                              fit: BoxFit.cover)),
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
          Text(
            "ANIMATED CONTAINER",
            style: TextStyle(
                fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
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
