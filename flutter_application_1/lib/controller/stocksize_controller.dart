import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:njoroder_application/model/stock_size.dart';

Future<List<DataSizeShr>> fetchDataStocksize() async {
  var url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbzc225VqnVLOiD4ZqMep8ijYRtbp-FB8ypJO3ihjInJJ4-a9G6Nanl9PWTTKmOEw2fOoQ/exec?func=stoshr');

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
      'https://script.google.com/macros/s/AKfycbzc225VqnVLOiD4ZqMep8ijYRtbp-FB8ypJO3ihjInJJ4-a9G6Nanl9PWTTKmOEw2fOoQ/exec?func=stotro');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => DataSizeTro.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
