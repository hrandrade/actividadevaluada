import 'package:actividadevaluada/main.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedAlign.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedContainer.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedCrossFade.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedOpacity.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedPadding.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedPhysicalModel.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedPositioned.dart';
import 'package:actividadevaluada/paginas/animaciones/animatedSlide.dart';
import 'package:actividadevaluada/paginas/contenedores.dart';
import 'package:actividadevaluada/paginas/dogs.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:actividadevaluada/json/dogs_json.dart';

class DetaDog extends StatefulWidget {
  const DetaDog({Key? key, this.dog}) : super(key: key);
  final dynamic dog;
  @override
  State<DetaDog> createState() => _DetaDogState();
}

class _DetaDogState extends State<DetaDog> {

  CrossFadeState state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 0, 36), //color de fondo
      body: cuerpoAlbum(),
      appBar: appSpot(),
    );
  }

  Widget cuerpoAlbum() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  width: size.width,
                  height: 260,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.dog['img']),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.dog['title'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Center(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          shadowColor: Colors.white,
                          backgroundColor: Colors.tealAccent,
                          side: BorderSide(color: Colors.blue, width: 1),
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        onPressed: () => _dialogBuilder1(context),
                        icon: const Icon(FontAwesomeIcons.paw),
                        label: const Text('  ADOPTAR  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: Center(
                    child: Text(widget.dog['description'],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: Center(
                    child: Text("* ANIMACIONES *",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //ANIMATED ALIGN
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Align",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 96),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade100,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AAlign(
                                      imgAlign: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //ANIMATED CONTAINER
              SizedBox(
                height: 5,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Container",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AContainer(
                                      imgContainer: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //ANIMATED POSITIONED
              SizedBox(
                height: 5,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Positioned",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 53.2),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade100,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: APositioned(
                                      imgPositioned: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //ANIMATED CROSS FADE
              SizedBox(
                height: 5,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Cross Fade",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: ACrossFade(
                                      imgCrossFade: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),

              //ANIMATED OPACITY
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Opacity",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade100,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AOpacity(
                                      imgOpacity: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              //ANIMATED PADDING
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Padding",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 76),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: APadding(
                                      imgPadding: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              //ANIMATED SLIDE
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated Slide",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 103),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade100,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: ASlide(
                                      imgSlide: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              //ANIMATED PHYSICALMODEL
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Animated PhysicalModel",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            //cambio de wiget top
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: APhysicalModel(
                                      imgPhysicalModel: widget.dog['img'],
                                    ),
                                    type: PageTransitionType.scale));
                            //fin cambio de widget top
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //Mensaje 1
  Future<void> _dialogBuilder1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estas de acuerdo en adoptarlo?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Regresar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Confirmar'),
              onPressed: () {
                _dialogBuilder2(context);
              },
            ),
          ],
        );
      },
    );
  }

  //Mensaje 2
  Future<void> _dialogBuilder2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Gracias por adoptar'),
          content: const Text(
              'Te hemos enviado  un correo en el cual se especifican a detalle los datos del perro asi como los acuerdos para la adopción.'),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('De Acuerdo'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          alignment: Alignment.bottomCenter,
                          child: Contenedores(),
                          type: PageTransitionType.scale),
                      (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        );
      },
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
            "DETALLE",
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
