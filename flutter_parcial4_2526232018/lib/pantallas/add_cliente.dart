import 'package:flutter/material.dart';
import 'package:flutter_parcial4_2526232018/services/firebase.dart';

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  TextEditingController clientesController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Container(
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
          title: const Text("Agregar Cliente"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Pagina Agregar Cliente',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              TextField(
                controller: clientesController,
                decoration: const InputDecoration(
                  hintText: 'Ingresar el cliente',
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    //print(usuariosController.text);
                    await agregarClientes(clientesController.text).then((_) {
                      Navigator.pop(context);
                    });
                    //   Navigator.pop(context);
                  },
                  child: const Text("Guardar")),
            ],
          ),
        ),
      ),
    );
  }
}
