import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/screen/bottom_controller.dart';
import 'package:wasteninja/screen/forgot.dart';
import 'package:wasteninja/screen/register.dart';
import 'package:wasteninja/widget/spinner.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  bool animateSize = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> switchPage() async {
    if (!emailController.text.contains("@") ||
        emailController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Email address"),
        ),
      );
      return;
    }
    if (passwordController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Wrong password"),
        ),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (context) => Spinner(text: "logging in"),
    );

    try {
      final provider = Provider.of<AuthBase>(context, listen: false);
      await provider.signIn(emailController.text, passwordController.text);
      Navigator.of(context).pop();

      setState(() {
        animateSize = !animateSize;
      });
      Future.delayed(
        Duration(
          milliseconds: 600,
        ),
      ).then(
        (value) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomController(),
              fullscreenDialog: true,
            ),
            (route) => false,
          );
        },
      );
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    print(kheight);
    print(kWidth);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: kheight,
          width: kWidth,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: kheight * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      "assets/images/66268-signinanimation.json",
                      repeat: false,
                      height: kheight * 0.4,
                      width: kWidth,
                    ),
                  ],
                ),
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    height: kheight > 900 ? kheight * 0.55 : kheight * 0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Enter your credentials to login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                // padding: EdgeInsets.only(bottom: 8, top: 12),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      CupertinoIcons.mail,
                                      color: kprimaryDeep,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    // isDense: true,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // padding: EdgeInsets.only(bottom: 10, top: 12),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: obscureText,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    focusColor: kprimaryDeep,
                                    prefixIcon: Icon(
                                      CupertinoIcons.lock,
                                      color: kprimaryDeep,
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscureText
                                            ? CupertinoIcons.eye
                                            : CupertinoIcons.eye_slash,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                    ),
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: CupertinoButton(
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      color: kprimaryDeep,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                        fullscreenDialog: true,
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: switchPage,
                                  child: AnimatedContainer(
                                    duration: Duration(
                                      milliseconds: 500,
                                    ),
                                    height: animateSize ? 60 : 55,
                                    width: animateSize ? 70 : 350,
                                    decoration: BoxDecoration(
                                      color: kprimaryDeep,
                                      borderRadius: BorderRadius.circular(
                                        animateSize ? 50 : 10,
                                      ),
                                    ),
                                    child: Center(
                                      child: animateSize
                                          ? Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          : Text(
                                              "Login",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: CupertinoButton(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "Don't have an account? Register",
                                      style: TextStyle(
                                        color: kprimaryDeep,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                        fullscreenDialog: true,
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
