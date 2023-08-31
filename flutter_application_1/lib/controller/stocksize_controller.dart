import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:njoroder_application/model/stock_size.dart';

Future<List<DataSizeShr>> fetchDataStocksize() async {
  var url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbxBp8PbJ5_r_vMHB9pkoVI5TX4LAxxCRoqpanm0gwzTFOrSt0LKpX3tVZIQgTB2NwSC7Q/exec?func=stoshr');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => DataSizeShr.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<DataSizeTro>> fetchDataStockTrosize() async {
  var url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbxBp8PbJ5_r_vMHB9pkoVI5TX4LAxxCRoqpanm0gwzTFOrSt0LKpX3tVZIQgTB2NwSC7Q/exec?func=stotro');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => DataSizeTro.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
