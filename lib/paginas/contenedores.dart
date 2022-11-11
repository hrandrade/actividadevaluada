import 'package:actividadevaluada/json/dogs_json.dart';
import 'package:actividadevaluada/paginas/dogs.dart';
import 'package:actividadevaluada/paginas/settings.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contenedores extends StatefulWidget {
  Contenedores({Key? key}) : super(key: key);

  @override
  State<Contenedores> createState() => _ContenedoresState();
}

class _ContenedoresState extends State<Contenedores> {
  int menu_activo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: spotFooter(),
      body: spotBody(),
    );
  }

  Widget spotBody() {
    return IndexedStack(index: menu_activo, children: [
      Dogs(),
      Settings()
    ]);
  }

  Widget spotFooter() {
    List items = [
      FontAwesomeIcons.dog,
      FontAwesomeIcons.gear,
    ];

    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(2, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    menu_activo = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: menu_activo == index ? Colors.black : Colors.greenAccent.shade100,
                  size: 35,
                ));
          }),
        ),
      ),
    );
  }
}
