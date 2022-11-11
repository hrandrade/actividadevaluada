import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class APositioned extends StatefulWidget {
  final imgPositioned;
  const APositioned({Key? key, required this.imgPositioned}) : super(key: key);

  @override
  State<APositioned> createState() => _APositionedState();
}

class _APositionedState extends State<APositioned> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 0, 36), //color de fondo
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 100, right: 10, bottom: 10),
        child: SizedBox(
          width: 200,
          height: 350,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                width: selected ? 300.0 : 70.0,
                height: selected ? 70.0 : 300.0,
                top: selected ? 50.0 : 150.0,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.imgPositioned),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: appSpot(),
    );
  }

  appSpot() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ANIMATED POSITIONED",
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
