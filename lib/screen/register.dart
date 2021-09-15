import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/screen/landingPage.dart';
import 'package:wasteninja/screen/loginPage.dart';
import 'package:wasteninja/widget/spinner.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;
  bool animateSize = false;
  bool checkValue = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  Future<void> switchPage() async {
    if (nameController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Wrong password"),
        ),
      );
      return;
    } else if (!emailController.text.contains("@") ||
        emailController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Email address"),
        ),
      );
      return;
    } else if (passwordController.text.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Wrong password"),
        ),
      );
      return;
    } else {
      showDialog(
        context: context,
        builder: (context) => Spinner(text: "Signing up"),
      );

      try {
        final provider = Provider.of<AuthBase>(context, listen: false);
        await provider.createUserAccount(
          emailController.text,
          passwordController.text,
          nameController.text,
        );
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
                builder: (context) => LandingPage(),
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
  }

  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
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
                height: kheight * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      "assets/images/66268-signinanimation.json",
                      repeat: false,
                      height: kheight * 0.35,
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: kheight > 900 ? kheight * 0.6 : kheight * 0.87,
                    width: kWidth,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 26.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Hello, Welcome",
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
                                "Enter your credentials to sign up",
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
                                controller: nameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    CupertinoIcons.person,
                                    color: kprimaryDeep,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Full name",
                                  // isDense: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                            SizedBox(
                              height: 20,
                            ),
                            CheckboxListTile(
                              activeColor: kprimaryDeep,
                              value: checkValue,
                              onChanged: (value) {
                                setState(() {
                                  checkValue = value!;
                                });
                              },
                              title: Text(
                                "I agree to terms and conditions",
                                style: TextStyle(fontSize: 15),
                              ),
                              subtitle: Text(
                                "Terms and conditions",
                                style: TextStyle(
                                  color: kprimaryDeep,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: checkValue
                                    ? () {
                                        switchPage();
                                      }
                                    : () {},
                                child: AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 500,
                                  ),
                                  height: animateSize ? 60 : 55,
                                  width: animateSize ? 70 : 350,
                                  decoration: BoxDecoration(
                                    color: checkValue
                                        ? kprimaryDeep
                                        : Theme.of(context).disabledColor,
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
                                            "Register",
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
                            //Spacer(),
                            Center(
                              child: CupertinoButton(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Already have an account? Login",
                                    style: TextStyle(
                                      color: kprimaryDeep,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
