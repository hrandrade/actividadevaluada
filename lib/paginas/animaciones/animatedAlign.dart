import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class AAlign extends StatefulWidget {
  final imgAlign;
  const AAlign({Key? key, required this.imgAlign}) : super(key: key);

  @override
  State<AAlign> createState() => _AAlignState();
}

class _AAlignState extends State<AAlign> {
  bool selected = false;

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
            selected = !selected;
          });
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Container(
                      width: 250.0,
                      height: 500,
                      color: Colors.tealAccent,
                      child: AnimatedAlign(
                        alignment: selected
                            ? Alignment.topLeft
                            : Alignment.bottomRight,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        child:  Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.imgAlign),
                              fit: BoxFit.cover)),
                        ),
                      ),
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
            "ANIMATED ALIGN",
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
