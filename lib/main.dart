import 'package:actividadevaluada/paginas/principal.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(Actividad());
}

class Actividad extends StatelessWidget {
  const Actividad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicit Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplahsInit(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplahsInit extends StatelessWidget {
  const SplahsInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:       
      Column(
        children: [
           Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/flutter.gif'), fit: BoxFit.cover),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.tealAccent.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(100)),
                ),
          
          SizedBox(height: 20,),
          const Text('Implicit Animations', 
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),),
        ],
      ), 
      backgroundColor: Color.fromARGB(255, 11, 0, 36),
      nextScreen: Principal(),
      splashIconSize: 250,
      duration: 6000,
      animationDuration: const Duration(seconds: 1),
      pageTransitionType: PageTransitionType.fade,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
