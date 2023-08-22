import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:njoroder_application/model/stock_model.dart';

class FormStockController {
  //
  static const STATUS_SUCCESS = "SUCCESS";

  static const String URLGetStock =
      "https://script.google.com/macros/s/AKfycbw6nzls58G28NF2R4L5m475NMsyi3VdpvSjE4c_thSxVBOAxgVeOS9W9WmVtspOHowdEw/exec?func=params"; // API Get Stock

  // Future<List<String>> getStock(void Function(String) callback) async {
  //   List<String> arrStock;
  //   try {
  //     String txtParams = URLGetStock;
  //     await http.get(Uri.parse(txtParams)).then((response) {
  //       Map<String, dynamic> jdata =
  //           convert.jsonDecode(response.body)['status'];
  //       print('Howdy, ${jdata['status']}!');
  //       //var strBack = callback(convert.jsonDecode(response.body)['status']);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  List<ResStockData> parseStock(String responseBody) {
    final parsed =
        convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ResStockData>((json) => ResStockData.fromJson(json))
        .toList();
  }

  Future<List<ResStockData>> fetchStock() async {
    final response = await http.get(Uri.parse(URLGetStock));
    // Use the compute function to run parsePhotos in a separate isolate.
    return parseStock(response.body);
  }
}
