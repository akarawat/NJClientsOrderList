import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:njoroder_application/controller/form_controller.dart';
import 'package:njoroder_application/controller/formpost_controller.dart';
import 'package:njoroder_application/homestock.dart';
import 'package:njoroder_application/main.dart';
import 'package:njoroder_application/sizestock.dart';
import 'model/delrow_model.dart';
import 'dart:async';
import 'controller/delrow_controller.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: RowSetting(),
  ));
}

class RowSetting extends StatefulWidget {
  @override
  State<RowSetting> createState() => _RowSettingState();
}

class _RowSettingState extends State<RowSetting> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _flagConfirm = false;
  TextEditingController func = TextEditingController();
  TextEditingController val1 = TextEditingController();
  TextEditingController val2 = TextEditingController();

  //-->Start Confirm
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("ยกเลิก"),
      onPressed: () {
        Navigator.of(context).pop(); // Close
        _flagConfirm = false;
      },
    );
    Widget continueButton = TextButton(
      child: Text("ยืนยัน"),
      onPressed: () {
        Navigator.of(context).pop(); // Close
        _flagConfirm = true;
        _submitForm();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("ยันยืนการลบ"),
      content: Text("ยืนยันการลบข้อมูลใน Sheet?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //--> End Confirm
  //-->Start Message
  showMsgDialog(BuildContext context, String msg) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // Close
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Infomation"),
      content: Text(msg),
      actions: [
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  //--> End Message

  Future<void> _submitForm() async {
    bool flgUpdate = false;
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      DelRowForm delrowFormModel =
          DelRowForm("del", val1.text.trim(), val2.text.trim());

      DelRowController formController = DelRowController();
      formController.submitDelForm(delrowFormModel, (String response) {
        print("Response: $response");
        if (response == DelRowController.STATUS_SUCCESS) {
          flgUpdate = true;
        } else {
          flgUpdate = false;
        }
      });
      resetForm(true);
    }
  }

  void resetForm(bool resetFill) {
    setState(() {
      val1.text = "";
      val2.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    val1.text = "4";
    val2.text = "";
    int selectedIndex = 0; //New
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
        if (selectedIndex == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyApp()));
        } else if (selectedIndex == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => sizestock()));
        } else if (selectedIndex == 2) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeStock()));
        } else if (selectedIndex == 3) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RowSetting()));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("NJ Orders Application V300"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(2, 93, 221, 1),
                  Color.fromARGB(224, 250, 228, 56),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "ระบุแถวที่ต้องการลบ โดยเริ่มจากแถวที่ 4-1000 เท่านั้น",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: val1,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'แถวแรก'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(247, 48, 13, 1)
                                        .withOpacity(0.6)),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val2,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'แถวสุดท้าย'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(247, 48, 13, 1)
                                        .withOpacity(0.6)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () async {
                                      //showMsgDialog(context, "กำลังทำจ้า");
                                      if (val1.text == "" ||
                                          val2.text.isEmpty) {
                                        showMsgDialog(
                                            context, "ระบุข้อมูลไม่ครบ");
                                      } else {
                                        showAlertDialog(context);
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(100, 34, 29, 1)),
                                    ),
                                    child: Text('ยืนยันลบ'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () async {
                                      const url = FormController.URLGoogle;
                                      launchUrl(Uri.parse(url),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromRGBO(
                                                  1, 155, 14, 1)),
                                    ),
                                    child: const Text('Open Sheet'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ])),
            ),
          ])),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add),
      //       label: 'Add',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.delete),
      //       label: 'Delete',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: const Color.fromRGBO(2, 93, 221, 1),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: const TextStyle(
                    color: Color.fromARGB(255, 2, 161,
                        57)))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Stock Size',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Stock Model',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
