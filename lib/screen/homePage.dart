import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/screen/drawer.dart';
import 'package:wasteninja/screen/report.dart';
import 'package:wasteninja/widget/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 18,
          ),
          child: ListView(
            children: [
              _buildRow(context),
              _buildColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 8,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Lottie.asset(
                "assets/images/38814-menu.json",
                height: 60,
                width: 60,
                reverse: true,
                repeat: false,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1563453392212-326f5e854473?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Cleanliness is\nthe scourge of art",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 8, top: 12, bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cleaning Service",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We provide the best cleaning servicefor your home, offices, eventsand you name it!",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: kprimaryDeep,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Book now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      "assets/images/undraw_wash_hands_nwl2.svg",
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomCard(
            text: "Report",
            subText: "Report illegal dumping site",
            callback: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportDumping(),
              ),
            ),
            iconColor: Colors.red,
            icon: CupertinoIcons.exclamationmark_octagon,
          ),
          SizedBox(
            height: 10,
          ),
          CustomCard(
            text: "Mobile Bins",
            subText: "Rent or buy mobile bins",
            callback: () {},
            iconColor: Colors.yellow,
            icon: CupertinoIcons.bin_xmark,
          ),
          SizedBox(
            height: 10,
          ),
          CustomCard(
            text: "Cleaning Service",
            subText: "Book cleaning services ",
            callback: () {},
            iconColor: Colors.green,
            icon: CupertinoIcons.bookmark,
          ),
          SizedBox(
            height: 10,
          ),
          CustomCard(
            text: "Forum",
            subText: "Report any issue to us",
            callback: () {},
            iconColor: Colors.black,
            icon: CupertinoIcons.bubble_right,
          ),
        ],
      ),
    );
  }
}
