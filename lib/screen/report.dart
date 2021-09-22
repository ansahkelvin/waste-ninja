import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/helper/helperMethods.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/provider/provider.dart';
import 'package:wasteninja/widget/spinner.dart';

class ReportDumping extends StatefulWidget {
  ReportDumping({Key? key}) : super(key: key);

  @override
  _ReportDumpingState createState() => _ReportDumpingState();
}

class _ReportDumpingState extends State<ReportDumping> {
  File? fileImage;
  final infoController = TextEditingController();
  bool isLoading = false;

  Future<void> submitReport() async {
    final userId = Provider.of<AuthBase>(context, listen: false).currentUser;
    final location = Provider.of<AppProvider>(context, listen: false);
    showDialog(
        context: context, builder: (context) => Spinner(text: "Reporting"));
    final ref =
        FirebaseStorage.instance.ref().child("dumpsites").child(userId!.uid);


    await ref.putFile(fileImage!);
    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance.collection("dumps").doc(userId.uid).set({
      "additional_info": infoController.text,
      "latitude": location.userPosition!.latitude,
      "longitude": location.userPosition!.longitude,
      "place_name": location.placeAddress,
      "image_url": url,
    });
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          "Report Dumping Site",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 15.0,
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        "Allow your location to be used by the app\nTake pictures of the dumping site and submit",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image = await HelperMethods.openCamera();
                            if (image == null) {
                              return;
                            }
                            setState(() {
                              fileImage = image;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: kprimaryDeep,
                              ),
                            ),
                            margin: EdgeInsets.all(
                              20,
                            ),
                            height: 90,
                            width: 90,
                            child: Icon(
                              CupertinoIcons.camera_on_rectangle,
                              size: 40,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: fileImage == null
                              ? Center(
                                  child: Text(
                                    "Tap on the camera to take a picture",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              : Image.file(
                                  fileImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.location,
                        color: kprimaryDeep,
                      ),
                      title: Text(
                        provider.placeAddress.toString(),
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 12, top: 12),
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: TextFormField(
                        controller: infoController,
                        textInputAction: TextInputAction.done,
                        maxLines: 3,
                        decoration: InputDecoration(
                          focusColor: kprimaryDeep,
                          border: InputBorder.none,
                          hintText: "Additional Information",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: submitReport,
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
