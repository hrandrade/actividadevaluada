import 'package:actividadevaluada/json/dogs_json.dart';
import 'package:actividadevaluada/paginas/detalledog.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class Dogs extends StatefulWidget {
  Dogs({Key? key}) : super(key: key);

  @override
  State<Dogs> createState() => _DogsState();
}

class _DogsState extends State<Dogs> {
  int menuactivo = 0;
  int menuactivo2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 0, 36),
      appBar: appSpot(),
      body: bodySpot(),
    );
  }

  bodySpot() {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Center(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.4),
              itemCount: dogs.length, //datosUsuarios().length
              itemBuilder: (context, index) {
                return InkWell(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: Container(
                      width: 200,
                      height: 500,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(dogs[index]['img']),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.tealAccent.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 80, bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.tealAccent,
                          ),
                          child: Center(
                            child: Text(
                              dogs[index]['title'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    //cambio de wiget top
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: DetaDog(
                              dog: dogs[index],
                            ),
                            type: PageTransitionType.scale));
                    //fin cambio de widget top
                  },
                );
              },
            ),
          )),
    ]);
  }

  appSpot() {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 150, right: 110),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "DOGS",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                FontAwesomeIcons.paw,
                color: Colors.black,
                size: 22,
              ))
        ]),
      ),
    );
  }
}
