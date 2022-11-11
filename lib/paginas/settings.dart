import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 0, 36), //color de fondo
      body: spotBody(),
    );
  }

  Widget spotBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 120, left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ACTIVIDAD EVALUADA ETPS3-T",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent)),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, ),
              child: Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
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
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.users,
                        color: Colors.white,
                        size: 80,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("INTEGRANTES: ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, left: 10, right: 10),
              child: Text("Anubis Osiris Martínez Aguiluz",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Text("25-3760-2018",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, left: 10, right: 10),
              child: Text("Heber Rodrigo Ventura Andrade",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Text("25-2418-2018",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)
            ),
          ],
        ),
      ),
    );
  }
}
