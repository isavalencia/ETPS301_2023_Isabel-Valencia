import 'package:flutter/material.dart';
import 'package:flutter_parcial4_2526232018/services/firebase.dart';

class FireBaseParcial extends StatefulWidget {
  const FireBaseParcial({super.key});

  @override
  State<FireBaseParcial> createState() => _FireBaseParcialState();
}

class _FireBaseParcialState extends State<FireBaseParcial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Firebase',
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 151, 186, 252),
                Color.fromARGB(255, 89, 133, 255),
                Color.fromARGB(255, 97, 138, 252),
                Color.fromARGB(255, 24, 39, 248),
              ]),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FIREBASE P4ETPS3'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FutureBuilder(
              future: getClientes(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: ((context, index) {
                      //return Text(snapshot.data?[index]['nombre']);
                      return ListTile(
                        title: Text(snapshot.data?[index]['nombre']),

                        /*title: Text(snapshot.data?[index]['nombre']),*/
                        onTap: (() async {
                          await Navigator.pushNamed(context, "/edit");
                        }),
                      );
                    }),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(
                context,
                '/add',
              );
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
