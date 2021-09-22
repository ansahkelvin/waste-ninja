import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/provider/firestore.dart';
import 'package:wasteninja/provider/provider.dart';
import 'package:wasteninja/screen/landingPage.dart';
import 'package:wasteninja/screen/loginPage.dart';
import 'package:wasteninja/screen/splash.dart';

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
        Provider<AuthBase>(create: (context) => Auth()),
        ProxyProvider<AuthBase, FirestoreDB>(
          // create: (context) => ,
          update: (context, auth, data) => FirestoreDB(auth.uid),
        ),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Waste Ninja',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LandingPage(),
        routes: {
          LoginPage.route: (context) => LoginPage(),
          LandingPage.route: (context) => LandingPage(),
          SplashScreen.route: (context) => SplashScreen(),
        },
      ),
    );
  }
}
