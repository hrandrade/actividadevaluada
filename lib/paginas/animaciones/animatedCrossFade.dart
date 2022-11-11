import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class ACrossFade extends StatefulWidget {
  final imgCrossFade;
  const ACrossFade({Key? key, required this.imgCrossFade}) : super(key: key);

  @override
  State<ACrossFade> createState() => _ACrossFadeState();
}

class _ACrossFadeState extends State<ACrossFade> {
  double width = 300;
  double height = 500;
  CrossFadeState state = CrossFadeState.showFirst;

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
            state = state == CrossFadeState.showFirst
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst;
          });
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: AnimatedCrossFade(
                      firstChild: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.imgCrossFade),
                                fit: BoxFit.cover)),
                      ),
                      secondChild: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/1.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      duration: Duration(seconds: 2),
                      crossFadeState: state,
                      firstCurve: Curves.easeInToLinear,
                      secondCurve: Curves.easeInToLinear,
                      sizeCurve: Curves.bounceOut,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // Center(
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 90,
                //       ),
                //       Text(
                //         "Cambiar Imagen",
                //         style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       SizedBox(
                //         width: 15,
                //       ),
                //       Container(
                //         width: 50,
                //         height: 50,
                //         decoration: BoxDecoration(
                //             color: Colors.blue,
                //             borderRadius: BorderRadius.circular(25)),
                //         child: IconButton(
                //           onPressed: () {
                //             setState(() {
                //               state = state == CrossFadeState.showFirst
                //                   ? CrossFadeState.showSecond
                //                   : CrossFadeState.showFirst;
                //             });
                //           },
                //           icon: Icon(
                //             Icons.add,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
            "ANIMATED CROSS FADE",
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
