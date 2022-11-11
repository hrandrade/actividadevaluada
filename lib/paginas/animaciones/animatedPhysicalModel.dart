import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class APhysicalModel extends StatefulWidget {
  final imgPhysicalModel;
  const APhysicalModel({Key? key, required this.imgPhysicalModel})
      : super(key: key);

  @override
  State<APhysicalModel> createState() => _APhysicalModelState();
}

class _APhysicalModelState extends State<APhysicalModel> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //color de fondo
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
            _first = !_first;
          });
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: AnimatedPhysicalModel(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      elevation: _first ? 0 : 25.0,
                      shape: BoxShape.rectangle,
                      shadowColor: Colors.red,
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        width: 300,
                        height: 300,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage(widget.imgPhysicalModel),
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
            "ANIMATED PHYSICALMODEL",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
