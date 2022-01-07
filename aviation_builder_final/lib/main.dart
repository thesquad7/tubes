import 'package:aviation_builder_final/penganturan/fungsilog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/Login/log.dart';
import 'UI/home_ui/navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<authtentikasi>(
          create: (_) => authtentikasi(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<authtentikasi>().authStateChanges, initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Aviation Builder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Nav();
    }
    return LoginScreen();
  }
}