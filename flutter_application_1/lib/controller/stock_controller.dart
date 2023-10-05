import 'package:http/http.dart' as http;
import 'package:njoroder_application/model/stock_model.dart';
import 'dart:convert';

Future<List<Data>> fetchData() async {
  // var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  // var url = Uri.parse(
  //     'https://script.google.com/macros/s/AKfycbxfCGjLeENRqPRGiH6UOhxEcEZclanPc0VZG2y_X1f8Re1zgO92OabM8Z4qSkYCSV5bvg/exec?func=stock');
  var url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbwNMRuW0TTIhHvucvUpRYy9JndjkPKrLkkpblTtEpNygwdwGvjbOjArhGhIhvY6Kl9z9w/exec?func=stock');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
