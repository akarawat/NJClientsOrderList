import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:njoroder_application/main.dart';
import 'package:njoroder_application/row_setting.dart';
import 'model/delrow_model.dart';
import 'dart:async';
import 'controller/delrow_controller.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: HomeStock(),
  ));
}

class HomeStock extends StatefulWidget {
  @override
  State<HomeStock> createState() => _HomeStockState();
}

class _HomeStockState extends State<HomeStock> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0; //New
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
        if (selectedIndex == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeStock()));
        } else if (selectedIndex == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyApp()));
        } else if (selectedIndex == 2) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RowSetting()));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("NJ Orders Application"),
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
              child: const Padding(
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
                                "รายการ STOCK คงเหลือ",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
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
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
