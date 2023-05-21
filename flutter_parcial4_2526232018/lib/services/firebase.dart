import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore baseD = FirebaseFirestore.instance;
Future<List> getClientes() async {
  List clientes = [];
  CollectionReference collectionReferenceClientes =
      baseD.collection('clientes');
  QuerySnapshot queryClientes = await collectionReferenceClientes.get();
  queryClientes.docs.forEach((documento) {
    clientes.add(documento.data());
  });

  return clientes;
}

Future<void> agregarClientes(String clientes) async {
  await baseD.collection('clientes').add({"nombre": clientes});
}
