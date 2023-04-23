import 'package:flutter/material.dart';
import 'package:flutter_parcial3_2526232018/temas/colores.dart';
import 'package:line_icons/line_icons.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      /*leading: IconButton(
        onPressed: null,
        icon: Text("Datos",
            style: TextStyle(
                fontSize: 15, color: primario, fontWeight: FontWeight.w500)),
      ),*/
      actions: [
        IconButton(
            onPressed: null,
            icon: Icon(
              LineIcons.digitalTachograph,
              color: black,
              size: 40,
            ))
      ],
    );
  }

  Widget getBody() {
    var tamanio = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 215, 201, 248),
            Color.fromARGB(255, 173, 160, 248),
            Color.fromARGB(255, 125, 80, 248),
            Color.fromARGB(255, 22, 1, 70),
          ])),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 180),
                  //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("PARCIAL 3 ETPS3",
                      style: TextStyle(
                          fontSize: 25,
                          color: black,
                          fontWeight: FontWeight.w500)),
                ),
                Text("Nombres",
                    style: TextStyle(
                        fontSize: 23,
                        color: black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 10, top: 5),
                  child: Divider(
                    color: white.withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Primer Nombre",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 37, 165, 41),
                            fontWeight: FontWeight.w500)),
                    Text("Segundo Nombre",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 37, 165, 41),
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: white.withOpacity(0.8),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 20, left: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/img/isabel.png",
                      fit: BoxFit.cover, height: 70, width: 70),
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " María  Isabel",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "25-2623-2018",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
