import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pantallas/add_cliente.dart';
import 'pantallas/firebaseapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FBParcial4());
}

class FBParcial4 extends StatelessWidget {
  const FBParcial4({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter FireBase Parcial 4',
      initialRoute: '/',
      routes: {
        '/': (context) => const FireBaseParcial(),
        '/add': (context) => const AddClient(),
      },
    );
  }
}
