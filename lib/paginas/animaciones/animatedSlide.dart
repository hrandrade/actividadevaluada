import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class ASlide extends StatefulWidget {
  final imgSlide;
  const ASlide({Key? key, required this.imgSlide}) : super(key: key);

  @override
  State<ASlide> createState() => _ASlideState();
}

class _ASlideState extends State<ASlide> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 0, 36), //color de fondo
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(50.0),
                      child: AnimatedSlide(
                        offset: offset,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child:  Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.imgSlide),
                              fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text('Y', style: textTheme.bodyMedium),
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Slider(
                            min: -5.0,
                            max: 5.0,
                            value: offset.dy,
                            onChanged: (double value) {
                              setState(() {
                                offset = Offset(offset.dx, value);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('X', style: textTheme.bodyMedium),
                Expanded(
                  child: Slider(
                    min: -5.0,
                    max: 5.0,
                    value: offset.dx,
                    onChanged: (double value) {
                      setState(() {
                        offset = Offset(value, offset.dy);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 48.0),
              ],
            ),
          ],
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
            "ANIMATED SLIDE",
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
