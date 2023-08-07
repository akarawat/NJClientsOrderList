import 'package:flutter/material.dart';
import 'controller/formpost_controller.dart';
import 'model/formpost_model.dart';

void main() {
  runApp(MaterialApp(
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

  Future<bool> _submitForm() async {
    if (txtFill.text == "") return false;
    bool flgUpdate = false;
    // Validate returns true if the form is valid, or false
    // otherwise.
    //if (minval3idController.text == "0" ||
    //    maxval3idController.text == "0" ||
    //    curval3Controller.text == "") {
    //  return;
    //}
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      PostbackForm feedbackForm = PostbackForm(
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
          val24.text,
          val25Post.text);

      FormPostController formController = FormPostController();
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormPostController.STATUS_SUCCESS) {
          flgUpdate = true;
        } else {
          flgUpdate = false;
        }
      });
    }
    return true;
  }

  List<String> arrModels = [];
  List<String> listitems = [
    'คอจีนกระดุมหน้า',
    'คอวีเรียบ',
    'คอปาดเรียบ',
    'คอกลมผูกโบว์',
    'คอจีนผ่าหน้า',
    'คอจีนกระเป๋า',
    'คอปก',
    'กางเกง',
  ];
  String selectval = "คอวีเรียบ";
  List<String> listitemsSize = [
    '36',
    '40',
    '42',
    '44',
    '48',
    '52',
    '56',
    'M',
    'L',
    'XL',
  ];
  String selectvalSize = "36";
  TextEditingController valTotal = TextEditingController();
  //String txtFill = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Dropdown Button in Flutter"),
            backgroundColor: Colors.deepPurpleAccent),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  minLines: 3,
                                  maxLines: null,
                                  controller: txtFill,
                                  keyboardType: TextInputType.multiline,
                                  decoration:
                                      InputDecoration(labelText: 'ข้อความ'),
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
                                child: Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        //resetForm(false);
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
                                          for (int i = 0; i < split.length; i++)
                                            i: split[i]
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
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
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
                                        setState(() {
                                          //resetForm(true);
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: DropdownButton(
                                  value: selectval,
                                  onChanged: (value) {
                                    setState(() {
                                      selectval = value.toString();
                                    });
                                  },
                                  items: listitems.map((itemone) {
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
                                  controller: valTotal,
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
                                      color: Theme.of(context).iconTheme.color,
                                      iconSize: 30,
                                      onPressed: () {
                                        setState(() {
                                          if ((selectval == null ||
                                                  selectvalSize == null) ||
                                              (valTotal.text == "0" ||
                                                  valTotal.text == "")) return;
                                          arrModels.add(selectval.toString() +
                                              "|" +
                                              selectvalSize.toString() +
                                              "|" +
                                              valTotal.text);
                                          // val25Post.text +=
                                          //     selectedModel.toString() +
                                          //         "|" +
                                          //         selectedSize.toString() +
                                          //         "|" +
                                          //         valTotal.text;
                                        });
                                      },
                                    )
                                  ],
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
                                        if (await _submitForm()) {
                                          //resetForm(true);
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromRGBO(100, 34, 29, 1)),
                                      ),
                                      child: Text('บันทึก'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ])),
              ),
            ])));
  }
}
