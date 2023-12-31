import 'dart:convert';
// import 'dart:html';
import 'dart:io';
import 'dart:ui';

import 'package:njoroder_application/controller/stock_controller.dart';
import 'package:njoroder_application/homestock.dart';
import 'package:njoroder_application/model/stock_model.dart';
import 'package:njoroder_application/row_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ecbox_ggsheet_toto/report_data.dart';
import 'package:http/http.dart' as http;
import 'package:njoroder_application/model/formpost_model.dart';
import 'package:njoroder_application/sizestock.dart';
//import 'package:intl/intl_browser.dart';
import 'dart:async';
import 'controller/formpost_controller.dart';
import 'model/formpost_model.dart';
import 'model/resdata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// import 'package:flutter/material.dart';
// import 'controller/formpost_controller.dart';
// import 'model/formpost_model.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    ),
    darkTheme: ThemeData(brightness: Brightness.dark),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _flagConfirm = false;

  TextEditingController txtFill = TextEditingController();
  TextEditingController txtFillTmp = TextEditingController();
  TextEditingController val1 = TextEditingController();
  TextEditingController val3 = TextEditingController();
  TextEditingController val4 = TextEditingController();
  TextEditingController val5 = TextEditingController();
  TextEditingController val6 = TextEditingController();
  TextEditingController val7 = TextEditingController();
  TextEditingController val8 = TextEditingController();
  TextEditingController val9 = TextEditingController();
  TextEditingController val10 = TextEditingController();
  TextEditingController val11 = TextEditingController();
  TextEditingController val12 = TextEditingController();
  TextEditingController val13 = TextEditingController();
  TextEditingController val14 = TextEditingController();
  TextEditingController val15 = TextEditingController();
  TextEditingController val16 = TextEditingController();
  TextEditingController val17 = TextEditingController();
  TextEditingController val18 = TextEditingController();
  TextEditingController val19 = TextEditingController();
  TextEditingController val20 = TextEditingController();
  TextEditingController val21 = TextEditingController();
  TextEditingController val22 = TextEditingController();
  TextEditingController val23 = TextEditingController();
  TextEditingController val24 = TextEditingController();
  TextEditingController val25Post = TextEditingController();

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
      title: Text("ยันยืนการบันทึก"),
      content: Text("ยืนยันการเพิ่มข้อมูลใน Sheet?"),
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

  void _launchURL() async {
    // Open Google Sheet in default browser
    const url = FormPostController.URLGetStock;
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _submitForm() async {
    bool flgUpdate = false;
    for (var name in arrModels) {
      if (name != "") {
        val25Post.text += name + ",";
      }
    }
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      PostbackForm feedbackForm = PostbackForm(
          val1.text.trim(),
          "-",
          val3.text.trimLeft().trimRight(),
          val4.text.trimLeft().trimRight(),
          val5.text.trimLeft().trimRight(),
          val6.text.trimLeft().trimRight(),
          val7.text.trimLeft().trimRight(),
          val8.text.trimLeft().trimRight(),
          val9.text.trimLeft().trimRight(),
          val10.text.trimLeft().trimRight(),
          val11.text.trimLeft().trimRight(),
          val12.text.trimLeft().trimRight(),
          val13.text.trimLeft().trimRight(),
          val14.text.trimLeft().trimRight(),
          val15.text.trimLeft().trimRight(),
          val16.text.trimLeft().trimRight(),
          val17.text.trimLeft().trimRight(),
          val18.text.trimLeft().trimRight(),
          val19.text.trimLeft().trimRight(),
          val20.text.trimLeft().trimRight(),
          val21.text.trimLeft().trimRight(),
          val22.text.trimLeft().trimRight(),
          val23.text.trimLeft().trimRight(),
          val24.text.trimLeft().trimRight(),
          val25Post.text.trimLeft().trimRight());

      FormPostController formController = FormPostController();
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormPostController.STATUS_SUCCESS) {
          flgUpdate = true;
        } else {
          flgUpdate = false;
        }
      });
      resetForm(true);
    }
  }

  // bool loadStock = false;
  // Future<List<String>> getStock() async {
  //   if (_formKey.currentState!.validate()) {
  //     FormStockController formStockController = FormStockController();
  //     formStockController.getStock((String response) {
  //       print("Response: $response");
  //     });
  //   }
  //   return true;
  // }

  List<String> arrModels = [];
  List<String> listitemsSelect = [];
  List<String> listitemsWhite = [
    '',
    'คอจีนกระดุมหน้า',
    'คอวีเรียบ',
    'คอปาดเรียบ',
    'คอกลมผูกโบว์',
    'คอบัวจีน',
    'คอจีนกระเป๋า',
    'คอปก',
    'คอจีนแขน4ส่วน',
    'กางเกง',
  ];
  List<String> listitemsColor = [
    '',
    'คอจีนสีน้ำตาล',
    'คอจีนสีกรม',
    'คอจีนสีดำ',
    'คอจีนสีเปลือกไม้',
    'คอจีนสีเขียว',
    'คอจีนสีชมพู',
    'คอจีนสีม่วง',
    'กางเกง',
  ];
  String selectval = "";
  List<String> listitemsSize = [
    '',
    '36',
    '40',
    '42',
    '44',
    '48',
    '52',
    '56',
    'S',
    'M',
    'XL',
  ];
  String selectvalSize = "";
  TextEditingController valTotal = TextEditingController();

  //String txtFill = "";

  void resetForm(bool resetFill) {
    setState(() {
      if (resetFill) {
        txtFill.text = "";
      }
      txtFillTmp.text = "#ที่อยู่ 1 \n"
          "ที่อยู่ 2  \n"
          "#เบอร์โทร \n"
          "#FB \n"
          "#ยอดโอน =  0 \n"
          "#ปลายทาง =  0 \n"
          "#แบบ";
      val1.text = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
      val3.text = "";
      val4.text = "";
      val5.text = "";
      val6.text = "";
      val7.text = "0";
      val8.text = "0";
      val9.text = "0";
      val10.text = "0";
      val11.text = "0";
      val12.text = "0";
      val13.text = "0";
      val14.text = "0";
      val15.text = "0";
      val16.text = "0";
      val17.text = "0";
      val18.text = "0";
      val19.text = "";
      val20.text = "";
      val21.text = "";
      val22.text = "";
      val23.text = "";
      val24.text = "";
      val25Post.text = "";
      arrModels.clear();
      valTotal.text = "1";
      selectvalSize = "";
      selectval = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    txtFillTmp.text = "#ที่อยู่ 1 \n"
        "ที่อยู่ 2  \n"
        "#เบอร์โทร \n"
        "#FB \n"
        "#ยอดโอน =  0 \n"
        "#ปลายทาง =  0 \n"
        "#แบบ";
    if (val1.text == "")
      val1.text = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
    if (val5.text == "")
      val5.text = DateFormat('dd-MM-yyyy')
          .format(DateTime.now().add(const Duration(days: 1)))
          .toString();

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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 0.008),
            Color.fromARGB(0, 0, 0, 1),
          ],
        )),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    minLines: 3,
                                    maxLines: null,
                                    controller: txtFill,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                        labelText: 'ข้อความ'),
                                    style: const TextStyle(
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
                                  child: Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          //resetForm(false);
                                          if (txtFill.text == "") return;
                                          var multiline = txtFill.text
                                              .trim()
                                              .replaceAll(
                                                  RegExp(r'(\n){3,}'), "\n\n");
                                          multiline = multiline.replaceAll(
                                              RegExp(r'(\n)'), "");
                                          //var singleline = multiline.replaceAll(' ','');
                                          final tagName = multiline;

                                          final split = tagName.split('#');
                                          final Map<int, String> values = {
                                            for (int i = 0;
                                                i < split.length;
                                                i++)
                                              i: split[i]
                                          };
                                          //print(values);  // {0: grubs, 1:  sheep}

                                          final value1 = values[1]; //ที่อยู่
                                          final value2 = values[2]; //เบอร์
                                          final value7 = values[3]; //FB
                                          final value19 = values[4]; //ยอดโอน
                                          final value21 = values[5]; //ปลายทาง

                                          val3.text = value1.toString();
                                          val4.text = value2.toString();
                                          val7.text = value7.toString();

                                          List<String> arrTrans =
                                              value19.toString().split('=');
                                          val19.text = arrTrans[1];

                                          List<String> arrCash =
                                              value21.toString().split('=');
                                          val21.text = arrCash[1];
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromRGBO(
                                                      100, 34, 29, 1)),
                                        ),
                                        child: Text('ตรวจสอบ'),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            resetForm(true);
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.green),
                                        ),
                                        child: Text('Reset'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            //----Start Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  controller:
                                      val1, //editing controller of this TextField
                                  decoration: InputDecoration(
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText: "วันที่" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      val1.text = formattedDate;
                                    } else {
                                      val1.text = "";
                                      print("Date is not selected");
                                    }
                                  },
                                )),
                              ],
                            ),
                            //----Start Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: val3,
                                    decoration:
                                        InputDecoration(labelText: 'ที่อยู่ *'),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromARGB(255, 144, 0, 0)
                                            .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: val4,
                                    keyboardType: TextInputType.phone,
                                    decoration:
                                        InputDecoration(labelText: 'โทร *'),
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromARGB(255, 144, 0, 0)
                                            .withOpacity(0.6)),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: val7,
                                    keyboardType: TextInputType.text,
                                    decoration:
                                        InputDecoration(labelText: 'Facebook'),
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
                                        onPressed: () {
                                          setState(() {
                                            listitemsSelect = listitemsWhite;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color(0xFF0759CD)),
                                        ),
                                        child: Text('ชุด ขาว'),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            listitemsSelect = listitemsColor;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 186, 162, 4)),
                                        ),
                                        child: Text('ชุด  สี'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    dropdownColor:
                                        Color.fromRGBO(9, 155, 246, 1),
                                    value: selectval,
                                    onChanged: (value) {
                                      setState(() {
                                        selectval = value.toString();
                                      });
                                    },
                                    items: listitemsSelect.map((itemone) {
                                      return DropdownMenuItem(
                                          value: itemone, child: Text(itemone));
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  child: DropdownButton(
                                    value: selectvalSize,
                                    onChanged: (value) {
                                      setState(() {
                                        selectvalSize = value.toString();
                                      });
                                    },
                                    items: listitemsSize.map((itemone) {
                                      return DropdownMenuItem(
                                          value: itemone, child: Text(itemone));
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: TextFormField(
                                    controller: valTotal..text = '1',
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        labelText: 'จำนวน',
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0)),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.add_circle),
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        iconSize: 30,
                                        onPressed: () {
                                          bool flag = false;
                                          if (selectval == "กางเกง" &&
                                              (selectvalSize == "S" ||
                                                  selectvalSize == "M" ||
                                                  selectvalSize == "XL")) {
                                            flag = true;
                                            // showMsgDialog(context,
                                            //     "เลิกไซส์ กางเกงไม่ถูกต้อง");
                                            // return;
                                          }
                                          if (selectval != "กางเกง" &&
                                              (selectvalSize == "36" ||
                                                  selectvalSize == "40" ||
                                                  selectvalSize == "42" ||
                                                  selectvalSize == "44" ||
                                                  selectvalSize == "48" ||
                                                  selectvalSize == "52" ||
                                                  selectvalSize == "56")) {
                                            flag = true;
                                          }
                                          if ((selectval == "" ||
                                                  selectvalSize == "") ||
                                              (valTotal.text == "0" ||
                                                  valTotal.text == "")) {
                                            flag = false;
                                          }
                                          print(flag);
                                          if (!flag) {
                                            showMsgDialog(context,
                                                "เลือกข้อมูลแบบ-ไซส์-จำนวน \nให้ถูกต้อง");
                                            return;
                                          } else {
                                            setState(() {
                                              arrModels.add(
                                                  "$selectval|$selectvalSize|${valTotal.text}");
                                              selectval = "";
                                              selectvalSize = "";
                                            });
                                          }
                                          /*
                                        if ((selectval == "" ||
                                                selectvalSize == "") ||
                                            (valTotal.text == "0" ||
                                                valTotal.text == "")) {
                                          showMsgDialog(context,
                                              "เลือกข้อมูลแบบ-ไซส์-จำนวน");
                                          return;
                                        } else {
                                          setState(() {
                                            arrModels.add(selectval.toString() +
                                                "|" +
                                                selectvalSize.toString() +
                                                "|" +
                                                valTotal.text);
                                          });
                                        }
                                        */
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: arrModels.map((txtLine) {
                                final arr = txtLine.split('|');
                                return Container(
                                  // ignore: sort_child_properties_last
                                  child: ListTile(
                                    title: Text(
                                        "${arr[0]}     Size: ${arr[1]}     จำนวน: ${arr[2]}"),
                                    //subtitle: Text(_arr[1] + ":" + _arr[2]),
                                    trailing: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.redAccent),
                                      child: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          arrModels.removeWhere(
                                              (item) => item == txtLine);
                                        });
                                      },
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.green[100],
                                );
                              }).toList(),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: val19,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: '(เงินสด) ยอดเงิน'),
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color:
                                            const Color.fromRGBO(247, 48, 13, 1)
                                                .withOpacity(0.6)),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: val21,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        labelText: '(ปลายทาง) ยอดเงิน'),
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color:
                                            const Color.fromRGBO(26, 6, 211, 1)
                                                .withOpacity(0.6)),
                                  ),
                                ),
                                // Expanded(
                                //   child: TextFormField(
                                //     controller: val20,
                                //     keyboardType: TextInputType.number,
                                //     decoration: InputDecoration(
                                //         labelText: '(เงินสด) ยอดโอน'),
                                //     style: TextStyle(
                                //         fontStyle: FontStyle.normal,
                                //         color: Color.fromRGBO(247, 48, 13, 1)
                                //             .withOpacity(0.6)),
                                //   ),
                                // ),
                              ],
                            ),
                            //----Start Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  controller:
                                      val5, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText:
                                          "วันที่ส่ง" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      val5.text = formattedDate;
                                    } else {
                                      val5.text = "";
                                      print("Date is not selected");
                                    }
                                  },
                                )),
                                Expanded(
                                  child: TextFormField(
                                    controller: val6,
                                    keyboardType: TextInputType.text,
                                    decoration:
                                        InputDecoration(labelText: 'เลขพัสดุ'),
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Color.fromARGB(255, 20, 160, 2)
                                            .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            //----Start Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: val24,
                                    keyboardType: TextInputType.text,
                                    decoration:
                                        InputDecoration(labelText: 'หมายเหตุ'),
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Color.fromARGB(255, 10, 109, 240)
                                            .withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (val3.text == "" ||
                                              (arrModels.isEmpty) ||
                                              val4.text.isEmpty) {
                                            showMsgDialog(
                                                context, "ระบุข้อมูลไม่ครบ");
                                          } else {
                                            showAlertDialog(context);
                                            // if (_flagConfirm) {
                                            //   await _submitForm();
                                            // }
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromRGBO(
                                                      100, 34, 29, 1)),
                                        ),
                                        child: Text('บันทึก'),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    minLines: 3,
                                    maxLines: null,
                                    controller: txtFillTmp,
                                    keyboardType: TextInputType.multiline,
                                    decoration:
                                        InputDecoration(labelText: 'ตัวอย่าง'),
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                ),
              ])),
        ),
      ),
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
