import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/screen/loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;
  bool animateSize = false;
  bool checkValue = false;
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
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: SizedBox(
            height: kWidth * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Lottie.asset(
                  "assets/images/66268-signinanimation.json",
                  repeat: false,
                ),
                Expanded(
                  child: Container(
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
                              height: 30,
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
                                        setState(() {
                                          animateSize = !animateSize;
                                        });
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
                            Spacer(),
                            Center(
                              child: CupertinoButton(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Alreadt have an account? Login",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
