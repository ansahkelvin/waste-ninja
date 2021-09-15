import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/screen/homePage.dart';
import 'package:wasteninja/screen/splash.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static const route = '/landing';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthBase>(context);
    return StreamBuilder<User?>(
      stream: provider.onAuthChange(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return HomePage();
        }

        return SplashScreen();
      },
    );
  }
}
