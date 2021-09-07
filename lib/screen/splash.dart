import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wasteninja/models/splashModel.dart';
import 'package:wasteninja/screen/loginPage.dart';
import 'package:wasteninja/widget/pageItems.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final pageViewController = PageController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 16,
        ),
        child: Container(
          height: kheight,
          width: kWidth,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  controller: pageViewController,
                  physics: ClampingScrollPhysics(),
                  itemCount: SplashData.data.length,
                  itemBuilder: (context, index) => SplashItems(
                    model: SplashData.data[index],
                  ),
                ),
              ),
              Container(
                height: kheight * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                            fullscreenDialog: true,
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "skip".toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        SplashData.data.length,
                        (index) => Container(
                          margin: EdgeInsets.only(
                            right: 10,
                          ),
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            color: (selectedIndex == index)
                                ? Colors.white
                                : Colors.green,
                            border: (selectedIndex == index)
                                ? Border.all(color: Colors.green, width: 2)
                                : Border.all(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageViewController.nextPage(
                          duration: Duration(milliseconds: 5),
                          curve: Curves.bounceInOut,
                        );
                        if (selectedIndex == SplashData.data.length - 1) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                              fullscreenDialog: true,
                            ),
                            (route) => false,
                          );
                        }
                      },
                      child: Container(
                        width: kWidth * 0.3,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
