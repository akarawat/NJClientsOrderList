import 'dart:convert';
// import 'dart:html';
import 'dart:io';

// import 'package:ecbox_ggsheet_toto/motor_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ecbox_ggsheet_toto/report_data.dart';
import 'package:http/http.dart' as http;
//import 'package:intl/intl_browser.dart';
import 'dart:async';
import 'controller/form_controller.dart';
import 'model/form_model.dart';
import 'model/resdata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NJ Fashion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '-NJ Orders Fill List-'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String val1 = "0";
  String val2 = "0";
  String val3 = "0";
  String val4 = "0";
  String val5 = "0";
  String val6 = "0";
  String val7 = "0";
  String val8 = "0";
  String val9 = "0";
  String val10 = "0";
  String val11 = "0";
  String val12 = "0";
  String val13 = "0";
  String val14 = "0";
  String val15 = "0";
  String val16 = "0";
  String val17 = "0";
  String val18 = "0";
  String val19 = "0";
  String val20 = "0";
  String val21 = "0";

  String val1MinDef = "0";
  String val1MaxDef = "0";
  String _tmpMinDef = "0";
  String _tmpMaxDef = "0";
  String val3MinDef = "0";
  String val3MaxDef = "0";
  String tDisplay = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Timer? timer;
  bool flgUpdate = false;
  int sec_data = 5;
  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(new Duration(seconds: sec_data),
        (Timer timer) async {
      if (!flgUpdate) {
        //--->await this._fetchData();
        flgUpdate = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    final timer =
        Timer(const Duration(seconds: 5), () => print('Timer finished'));
    timer.cancel();
  }

  //Future<void> _fetchData() async {
  _fetchData() async {
    return;
    String _sReturn = "";

    const apiUrl = FormController.URLApiByOne;
    final response = await http.get(Uri.parse(apiUrl));
    final data = jsonDecode(response.body);
    for (dynamic res_data in data) {
      _sReturn += res_data.toString() + ", ";
    }
    _sReturn = _sReturn.replaceAll('[', '').replaceAll(']', '');
    print(_sReturn);

    setState(() {
      //--Debug--> tDisplay = _sReturn;
      List<String> _split = _sReturn.split(',');
      val1 = _split[0];
      val2 = _split[1];
      val3 = _split[2];
      val1MinDef = _split[3];
      val1MaxDef = _split[4];
      _tmpMinDef = _split[5];
      _tmpMaxDef = _split[6];
      val3MinDef = _split[7];
      val3MaxDef = _split[8];
    });
    final timer =
        Timer(const Duration(seconds: 5), () => print('Timer finished'));
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    var _flagConfirm = false;

    TextEditingController minval3idController = TextEditingController();
    TextEditingController maxval3idController = TextEditingController();

    TextEditingController maxval2Controller = TextEditingController();
    TextEditingController minval1Controller = TextEditingController();
    TextEditingController maxval1Controller = TextEditingController();

    TextEditingController flagController = TextEditingController();
    TextEditingController curval1Controller = TextEditingController();
    TextEditingController curval2Controller = TextEditingController();
    TextEditingController curval3Controller = TextEditingController();
    TextEditingController resDataController = TextEditingController();

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

    minval1Controller.text = val1MinDef;
    maxval1Controller.text = val1MaxDef;
    // val3.text = _tmpMinDef;
    txtFill.text = "# _\n" +
        "ที่อยู่ _ \n" +
        "_ \n" +
        "_  \n" +
        "#โทร._ \n" +
        "#เสื้อ _ = _ x _ , กางเกง = _ x _  \n" +
        "#FB: _ \n" +
        "#ยอดโอน = _ \n" +
        "#ปลายทาง = _ \n";
    txtFillTmp.text = "#ชื่อ สายบุญ ชุดขาว\n" +
        "999 ซอยหลังวัดดอน  ถนนเจริญกรุง63 \n" +
        "แขวงยานนาวา \n" +
        "เขตสาทร กทม. 10120  \n" +
        "#โทร.081999999 \n" +
        "#คอจีนกระดุมหน้า = 48 x 1 , กางเกง = M x 1  \n" +
        "#FB :  Narma \n" +
        "#ยอดโอน =  0 \n" +
        "#ปลายทาง =  0 \n";
    val1.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
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

    maxval2Controller.text = _tmpMaxDef;
    minval3idController.text = val3MinDef;
    maxval3idController.text = val3MaxDef;

    // autoPress(); --- ปิดในหน้านี้
    _showSnackbar(String message) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('ผลการบันทึก'),
          content: Text(message.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    Future<bool> _submitForm() async {
      if (val3.text == "") return false;
      // Validate returns true if the form is valid, or false
      // otherwise.
      //if (minval3idController.text == "0" ||
      //    maxval3idController.text == "0" ||
      //    curval3Controller.text == "") {
      //  return;
      //}
      if (_formKey.currentState!.validate()) {
        // If the form is valid, proceed.
        print(curval1Controller.text);
        FeedbackForm feedbackForm = FeedbackForm(
            val1.text,
            "-",
            val3.text,
            val4.text,
            val5.text,
            val6.text,
            val7.text,
            val8.text,
            val9.text,
            val10.text,
            val11.text,
            val12.text,
            val13.text,
            val14.text,
            val15.text,
            val16.text,
            val17.text,
            val18.text,
            val19.text,
            val20.text,
            val21.text,
            val22.text,
            val23.text,
            val24.text);

        FormController formController = FormController();
        formController.submitForm(feedbackForm, (String response) {
          print("Response: $response");
          if (response == FormController.STATUS_SUCCESS) {
            // Feedback is saved succesfully in Google Sheets.
            _showSnackbar(FormController.STATUS_SUCCESS);
            flgUpdate = true;
          } else {
            // Error Occurred while saving data in Google Sheets.
            _showSnackbar("Error Occurred!");
            flgUpdate = false;
          }
        });
        val3.text = "";
      }
      return flgUpdate;
    }

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

    void _launchURL() async {
      // Open Google Sheet in default browser
      const url = FormController.URLGoogle;
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    void resetForm(bool resetFill) {
      if (resetFill) {
        txtFill.text = "# _\n" +
            "ที่อยู่ _ \n" +
            "_ \n" +
            "_  \n" +
            "#โทร._ \n" +
            "#เสื้อ _ = _ x _ , กางเกง = _ x _  \n" +
            "#FB: _ \n" +
            "#ยอดโอน = _ \n" +
            "#ปลายทาง = _ \n";
      }
      txtFillTmp.text = "#ชื่อ สายบุญ ชุดขาว\n" +
          "999 ซอยหลังวัดดอน  ถนนเจริญกรุง63 \n" +
          "แขวงยานนาวา \n" +
          "เขตสาทร กทม. 10120  \n" +
          "#โทร.081999999 \n" +
          "#คอจีนกระดุมหน้า = 48 x 1 , กางเกง = M x 1  \n" +
          "#FB :  Narma \n" +
          "#ยอดโอน =  0 \n" +
          "#ปลายทาง =  0 \n";
      val1.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
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
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      decoration: InputDecoration(labelText: 'ข้อความ'),
                      style: TextStyle(
                          fontStyle: FontStyle.normal, color: Colors.black),
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
                            resetForm(false);
                            var multiline = txtFill.text
                                .trim()
                                .replaceAll(RegExp(r'(\n){3,}'), "\n\n");
                            multiline =
                                multiline.replaceAll(RegExp(r'(\n)'), "");
                            //var singleline = multiline.replaceAll(' ','');
                            final tagName = multiline;

                            final split = tagName.split('#');
                            final Map<int, String> values = {
                              for (int i = 0; i < split.length; i++) i: split[i]
                            };
                            //print(values);  // {0: grubs, 1:  sheep}

                            final value1 = values[1]; //ที่อยู่
                            final value2 = values[2]; //เบอร์
                            final value7 = values[4]; //FB
                            final value20 = values[5]; //ยอดโอน
                            final value21 = values[6]; //ปลายทาง
                            val3.text = value1.toString();
                            val4.text = value2.toString();
                            val7.text = value7.toString();

                            List<String> arrTrans =
                                value20.toString().split('=');
                            val20.text = arrTrans[1];

                            List<String> arrCash =
                                value21.toString().split('=');
                            val21.text = arrCash[1];

                            //=> Model Shirt
                            List<String> models =
                                values[3].toString().split(',');
                            for (var i = 0; i < models.length; i++) {
                              var sModel = models[i].split('=');
                              switch (sModel[0].trim()) {
                                case "กางเกง":
                                  var uperString = sModel[1].toString();
                                  uperString.replaceAll('X', 'x');
                                  uperString.replaceAll('m', 'M');
                                  uperString.replaceAll('l', 'L');
                                  uperString.replaceAll('xl', 'XL');
                                  List<String> troSize = uperString.split('x');
                                  if (troSize[0].toUpperCase().trim() == "M")
                                    val16.text = troSize[1];
                                  else if (troSize[0].toUpperCase().trim() ==
                                      "L")
                                    val17.text = troSize[1];
                                  else if (troSize[0].toUpperCase().trim() ==
                                      "XL") val18.text = troSize[1];
                                  break;
                                default: //case อื่นๆ ตีเป็นเสื้อเลย
                                  val8.text = sModel[0];
                                  List<String> shiSize =
                                      sModel[1].toString().trim().split('x');

                                  if (shiSize[0].trim() == "36")
                                    val9.text = shiSize[1];
                                  else if (shiSize[0].trim() == "40")
                                    val10.text = shiSize[1];
                                  else if (shiSize[0].trim() == "42")
                                    val11.text = shiSize[1];
                                  else if (shiSize[0].trim() == "44")
                                    val12.text = shiSize[1];
                                  else if (shiSize[0].trim() == "48")
                                    val13.text = shiSize[1];
                                  else if (shiSize[0].trim() == "52")
                                    val14.text = shiSize[1];
                                  else if (shiSize[0].trim() == "56")
                                    val15.text = shiSize[1];

                                  break;
                              }

                              //print(models[i]);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(100, 34, 29, 1)),
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
                            resetForm(true);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text('Reset'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //----Start Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: val3,
                                decoration:
                                    InputDecoration(labelText: 'ที่อยู่'),
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black.withOpacity(0.6)),
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
                                decoration: InputDecoration(labelText: 'โทร'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black.withOpacity(0.6)),
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
                        //----Start Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: val8,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(labelText: 'Model'),
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
                                controller: val9,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '36'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '40'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val11,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '42'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val12,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '44'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val13,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '48'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val14,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '52'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val15,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: '56'),
                              ),
                            ),
                          ],
                        ),
                        //----Start Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text("กางเกง"),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val16,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'เล็ก M'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val17,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'ปกติ L'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val18,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'พิเศษ XL'),
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
                                controller: val19,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: '(เงินสด) ยอดเงิน'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(247, 48, 13, 1)
                                        .withOpacity(0.6)),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: val20,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: '(เงินสด) ยอดโอน'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(247, 48, 13, 1)
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
                                controller: val21,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: '(ปลายทาง) ยอดเงิน'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(26, 6, 211, 1)
                                        .withOpacity(0.6)),
                              ),
                            ),
                            Expanded(
                                child: TextFormField(
                              controller:
                                  val22, //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  labelText:
                                      "(ปลายทาง) วันที่รับเงิน" //label text of field
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  val22.text = formattedDate;
                                } else {
                                  val22.text = "";
                                  print("Date is not selected");
                                }
                              },
                            )),
                            Expanded(
                              child: TextFormField(
                                controller: val23,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: '(ปลายทาง) ยอดรับ'),
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(26, 6, 211, 1)
                                        .withOpacity(0.6)),
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
                                  val5, //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  labelText: "วันที่ส่ง" //label text of field
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
                                      DateFormat('yyyy-MM-dd')
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
                      ],
                    ),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            showAlertDialog(context);
                            if (_flagConfirm) {
                              if (await _submitForm()) {
                                //resetForm(true);
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(100, 34, 29, 1)),
                          ),
                          child: Text('บันทึก'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            //_launchURL();
                            final Uri url = Uri.parse(FormController.URLGoogle);
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(100, 34, 29, 1)),
                          ),
                          child: Text('Open G-Sheet'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //----Start Horizoltal line
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: <Widget>[Divider(color: Colors.black)],
                    ),
                  ),
                ],
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
                      decoration: InputDecoration(labelText: 'ตัวอย่าง'),
                      style: TextStyle(
                          fontStyle: FontStyle.normal, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
