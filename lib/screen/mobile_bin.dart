import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/widget/priceRow.dart';

enum options {
  rent,
  sale,
}

class MobileBin extends StatefulWidget {
  const MobileBin({Key? key}) : super(key: key);

  @override
  _MobileBinState createState() => _MobileBinState();
}

class _MobileBinState extends State<MobileBin> {
  options value = options.rent;
  DateTime? selectedDate;
  DateTime? endSelectedDate;
  int counter = 1;
  int price = 200;

  Future<void> showDate(DateTime onSelect) async {
    await showCupertinoModalPopup(
      barrierColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: 200,
        width: double.infinity,
        child: CupertinoDatePicker(
          minimumDate: DateTime.now(),
          onDateTimeChanged: (time) {
            setState(() {
              onSelect = time;
            });
          },
        ),
      ),
    );
  }

  void setStartDate() async {
    await showCupertinoModalPopup(
      barrierColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: 200,
        width: double.infinity,
        child: CupertinoDatePicker(
          minimumDate: DateTime.now(),
          onDateTimeChanged: (time) {
            setState(() {
              selectedDate = time;
            });
          },
        ),
      ),
    );
  }

  void setEndDate() async {
    await showCupertinoModalPopup(
      barrierColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: 200,
        width: double.infinity,
        child: CupertinoDatePicker(
          minimumDate: DateTime.now(),
          onDateTimeChanged: (time) {
            setState(() {
              endSelectedDate = time;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: true,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Mobile Bins",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Fill out the form to continue",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  //controller: infoController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.mail, color: kprimaryDeep),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "kelvin@gmail.com",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //padding: EdgeInsets.only(bottom: 10, left: 12, top: 12),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      color: kprimaryDeep,
                    ),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "0244231211",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.location,
                      color: kprimaryDeep,
                    ),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "Accra,Ghana",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Options",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Rent",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Radio<options?>(
                                    groupValue: value,
                                    value: options.rent,
                                    onChanged: (options? onChange) {
                                      setState(() {
                                        value = onChange!;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Buy",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Radio<options?>(
                                    groupValue: value,
                                    value: options.sale,
                                    onChanged: (options? onChange) {
                                      setState(() {
                                        value = onChange!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ])),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              SizedBox(height: 20),
              value == options.rent ? _buildRent(context) : buildBuy(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBuy() => Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (price == 200) {
                          setState(() {
                            price = 200;
                          });
                        }
                        if (counter == 1) {
                          setState(() {
                            counter = 1;
                          });
                        } else {
                          setState(() {
                            counter--;
                            price = price - 200;
                          });
                        }
                      },
                      icon: Icon(
                        CupertinoIcons.minus,
                      ),
                    ),
                    Text(counter.toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                          price += 200;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(child: Text("Number of bins"))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: kprimaryDeep),
              color: Colors.white30,
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  PriceRow(
                    leftText: "Number of bins:",
                    rightText: counter.toString(),
                  ),
                  SizedBox(height: 10),
                  PriceRow(
                    leftText: "Total Price",
                    rightText: "GHC $price",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Center(
                  child: Text(
                "Buy now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ],
      );

  Widget _buildRent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "Select Date",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: setStartDate,
                  child: Text("From Date"),
                ),
                selectedDate != null
                    ? Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          selectedDate.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black54),
                        )),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  TextButton(
                    onPressed: setEndDate,
                    child: Text("To Date"),
                  ),
                  endSelectedDate == null
                      ? Container()
                      : Container(
                          height: 50,
                          //width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            endSelectedDate.toString(),
                            style: TextStyle(color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          )),
                        ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        selectedDate != null && endSelectedDate != null
            ? Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: kprimaryDeep),
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      PriceRow(
                        leftText: "From",
                        rightText: selectedDate.toString(),
                      ),
                      SizedBox(height: 10),
                      PriceRow(
                        leftText: "To",
                        rightText: endSelectedDate.toString(),
                      ),
                      SizedBox(height: 10),
                      PriceRow(
                        leftText: "Total Price",
                        rightText: "GHC 20,000",
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Center(
                child: Text(
              "Rent now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
