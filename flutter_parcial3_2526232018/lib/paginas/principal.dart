import 'package:flutter/material.dart';
import 'package:flutter_parcial3_2526232018/paginas/apellidos.dart';
import 'package:flutter_parcial3_2526232018/paginas/apirest.dart';
import 'package:flutter_parcial3_2526232018/paginas/datos.dart';
import 'package:line_icons/line_icons.dart';

import '../temas/colores.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int paginaindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

//widget de body
  Widget getBody() {
    return IndexedStack(
      index: paginaindex,
      children: [
        Datos(),
        Apellidos(),
        Apirest(),
      ],
    );
  }

  //widget de bottomNavigationBar:
  Widget getFooter() {
    List iconosItems = [
      LineIcons.digitalTachograph,
      LineIcons.userInjured,
      LineIcons.database,
    ];
    List textoItems = [
      "Datos",
      "Apellidos",
      "ApiRest",
    ];

    return Container(
      height: 90,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(textoItems.length, (index) {
                return GestureDetector(
                  //Genra un estado al tocar la partanlla
                  onTap: () {
                    setState(() {
                      paginaindex = index;
                    });
                  },

                  child: Column(children: [
                    Icon(
                      iconosItems[index],
                      color: paginaindex == index
                          ? Colors.deepPurpleAccent.shade400
                          : Colors.deepPurpleAccent.shade100,
                      size: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(textoItems[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: paginaindex == index
                              ? Colors.deepPurpleAccent.shade400
                              : Colors.deepPurpleAccent.shade100,
                        )),
                  ]),
                );
              }

                  /*)[,
            ],*/
                  )),
        ),
      ),
    );
  }
}
