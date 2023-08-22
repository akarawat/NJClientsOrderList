import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:njoroder_application/main.dart';
import 'package:njoroder_application/model/stock_model.dart';
import 'package:njoroder_application/row_setting.dart';
import 'package:njoroder_application/controller/stock_controller.dart';

void main() {
  runApp(MaterialApp(
    home: HomeStock(),
  ));
}

/*
late final dynamic sample;
Future<List<Data>> fetchData() async {
  //List<dynamic> items;
  var url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbw6nzls58G28NF2R4L5m475NMsyi3VdpvSjE4c_thSxVBOAxgVeOS9W9WmVtspOHowdEw/exec?func=params');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    sample = jsonResponse;
    // List<Data> lstData = List.empty();
    // lstData.add(sample.asMap().forEach((index, value) => f2(index, value)));
    // return lstData;
    //-->return sample.asMap().forEach((index, value) => f2(index, value));

    //return sample.asMap().forEach((index, value) {});

    // return sample.asMap().forEach((index, value) {
    //   //var f2 = (index, value);
    //   Data resdata = Data(
    //       mCode: value[0].toString(),
    //       mName: value[1].toString(),
    //       size36: value[2].toString(),
    //       size40: value[3].toString(),
    //       size42: value[4].toString(),
    //       size44: value[5].toString(),
    //       size48: value[6].toString(),
    //       size52: value[7].toString(),
    //       size56: value[8].toString(),
    //       sizeL: value[9].toString(),
    //       sizeM: value[10].toString(),
    //       sizeXL: value[11].toString());
    //   return resdata;
    // });

    //return jsonResponse.map((resdata) => Data.fromJson(resdata)).toList();
    // return jsonResponse.map((sample) => Data.fromJson(sample)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

// f2(int index, value) {
//   //var val2 = value[2].toString() == '' ?? '0';
//   Data resdata = Data(
//       mCode: value[0].toString(),
//       mName: value[1].toString(),
//       size36: value[2].toString(),
//       size40: value[3].toString(),
//       size42: value[4].toString(),
//       size44: value[5].toString(),
//       size48: value[6].toString(),
//       size52: value[7].toString(),
//       size56: value[8].toString(),
//       sizeL: value[9].toString(),
//       sizeM: value[10].toString(),
//       sizeXL: value[11].toString());
//   return resdata;
// }
class Data {
  final String? mCode;
  final String? mName;
  final String? size36;
  final String? size40;
  final String? size42;
  final String? size44;
  final String? size48;
  final String? size52;
  final String? size56;
  final String? sizeM;
  final String? sizeL;
  final String? sizeXL;

  Data(
      {required this.mCode,
      required this.mName,
      required this.size36,
      required this.size40,
      required this.size42,
      required this.size44,
      required this.size48,
      required this.size52,
      required this.size56,
      required this.sizeL,
      required this.sizeM,
      required this.sizeXL});

  factory Data.fromJson(Map<String, String> json) {
    return Data(
      mCode: json['mCode'] as String,
      mName: json['mName'] as String,
      size36: json['size36'] as String,
      size40: json['size40'] as String,
      size42: json['size42'] as String,
      size44: json['size44'] as String,
      size48: json['size48'] as String,
      size52: json['size52'] as String,
      size56: json['size56'] as String,
      sizeM: json['sizeM'] as String,
      sizeL: json['sizeL'] as String,
      sizeXL: json['sizeXL'] as String,
    );
  }
}
*/

class Data {
  final String firstName;
  final String lastName;
  final int age;

  Data({required this.firstName, required this.lastName, required this.age});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
    );
  }
}

Future<List<Data>> fetchData() async {
  var url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbyh-aWjn2dWVP8NvzYuMt0Ctq1mTH7UhahzC9O_YrqW/dev?func=params');
  final response = await http.get(url);
  response.headers;

  // const url =
  //     'https://script.google.com/macros/s/AKfycbyh-aWjn2dWVP8NvzYuMt0Ctq1mTH7UhahzC9O_YrqW/dev?func=stock';
  // final response = await http.get(Uri.parse(url), headers: {
  //   "Access-Control-Allow-Origin": "*",
  //   'Content-Type': 'application/json',
  //   'Accept': '*/*'
  // });

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class HomeStock extends StatefulWidget {
  @override
  State<HomeStock> createState() => _HomeStockState();
}

class _HomeStockState extends State<HomeStock> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FormStockController frmStock = FormStockController();

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
      body: FutureBuilder<List<Data>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 75,
                    color: Colors.white,
                    child: Center(
                      child: Text(snapshot.data![index].firstName),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
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

class StockDataList extends StatelessWidget {
  const StockDataList({super.key, required this.stockdatas});

  final List<ResStockData> stockdatas;

  @override
  // Widget build(BuildContext context) {
  //   return GridView.builder(
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //     ),
  //     itemCount: photos.length,
  //     itemBuilder: (context, index) {
  //       return Image.network(photos[index].thumbnailUrl);
  //     },
  //   );
  // }
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      }),
    );
  }
}
