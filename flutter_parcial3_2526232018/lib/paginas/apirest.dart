import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_parcial3_2526232018/temas/colores.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_parcial3_2526232018/modelo/games.dart';
import 'package:flutter_parcial3_2526232018/modelo/gifgiphy.dart';
import 'package:http/http.dart' as http;

class Apirest extends StatefulWidget {
  const Apirest({super.key});

  @override
  State<Apirest> createState() => _ApirestState();
}

class _ApirestState extends State<Apirest> {
  late Future<List<Gifgiphy>> _listadogiphy;

  Future<List<Gifgiphy>> _getgiphy() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=oiLEORXAK9q6XELJg2mOC5P8dHj08Noc&limit=25&rating=g"));

    List<Gifgiphy> gif = [];
    if (response.statusCode == 200) {
      String bodys = utf8.decode(response.bodyBytes);
      //print(bodys);

      final jsonData = jsonDecode(bodys);
      // print(jsonData["data"][0]["username"]);
      for (var item in jsonData["data"]) {
        gif.add(Gifgiphy(item["title"], item["images"]["downsized"]["url"]));
      }
      return gif;
    } else {
      throw Exception("Falla en conectarse");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadogiphy = _getgiphy();
  }

  @override
  Widget build(BuildContext context) {
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
      child: MaterialApp(
        title: "Api Rest",
        color: Colors.purpleAccent,
        home: Container(
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
          child: Scaffold(
              appBar: AppBar(
                title: Text("Api Games"),
              ),
              body: FutureBuilder(
                future: _listadogiphy,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // print(snapshot.data);
                    return GridView.count(
                      crossAxisCount: 2,
                      children: _listadogiphys(snapshot.requireData),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text("Soy error");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
        ),
      ),
    );
  }

  List<Widget> _listadogiphys(List<Gifgiphy> data) {
    List<Widget> gifs = [];
    for (var gif in data) {
      gifs.add(Card(
          child: Column(
        children: [
          Expanded(
            child: Image.network(
              gif.url,
              fit: BoxFit.fill,
            ),
          ),
          /*    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.nombre),
          ),*/
        ],
      )));
    }
    return gifs;
  }

  /*
  late Future<List<Games>> _listadogame;

  Future<List<Games>> _getgame() async {
    final response = await http.get(Uri.parse(
        "https://rapidapi.com/studio/api_82a252b8-736a-4bc7-a7f5-c997dbfb2018/client?shared_project=true"));

    List<Games> gif = [];
    if (response.statusCode == 200) {
      String bodys = utf8.decode(response.bodyBytes);
      //print(bodys);

      final jsonData = jsonDecode(bodys);
      // print(jsonData["data"][0]["username"]);
      for (var item in jsonData["data"]) {
        gif.add(Games(item["title"], item["images"]["downsized"]["url"]));
      }
      return gif;
    } else {
      throw Exception("Falla en conectarse");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadogame = _getgame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api Rest",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Api Flutter"),
          ),
          body: FutureBuilder(
            future: _listadogame,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data);
                return GridView.count(
                  crossAxisCount: 2,
                  children: _listadogame(snapshot.requireData),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("Soy error");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }

  List<Widget> _listadogiphys(List<Games> data) {
    List<Widget> game = [];
    for (var gif in data) {
      game.add(Card(
          child: Column(
        children: [
          Expanded(
            child: Image.network(
              gif.game_url,
              fit: BoxFit.fill,
            ),
          ),
          /*    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.nombre),
          ),*/
        ],
      )));
    }
    return gifs;
  }*/

  /*
     Scaffold(
      backgroundColor: primary,
      appBar: getAppBar(),
      //body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      /*leading: IconButton(
        onPressed: null,
        icon: Text("ApiRest",
            style: TextStyle(
                fontSize: 15, color: bgColor, fontWeight: FontWeight.w500)),
      ),*/
      actions: [
        IconButton(
            onPressed: null,
            icon: Icon(
              LineIcons.database,
              color: bgColor,
              size: 30,
            ))
      ],
    );
  }*/
}
