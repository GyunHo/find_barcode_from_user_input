import 'package:find_barcode_for_kim/auth.dart';
import 'package:find_barcode_for_kim/bloc.dart';
import 'package:find_barcode_for_kim/work.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return MaterialApp(
            home: AuthPage(),
          );
        } else {
          return ChangeNotifierProvider(
            create: (context)=>Scan(),

            child: MaterialApp(
              home: WorkPage(),
            ),
          );
        }
      },
    );
  }
}
