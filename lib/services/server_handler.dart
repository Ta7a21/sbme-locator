import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locator/coordinates.dart';

const String serverLink = 'http://localhost:8433/';
Map<int, Coordinates> positions = {
  0: Coordinates(0.89, 0.35),
  1: Coordinates(0.78, 0.28),
  2: Coordinates(0.64, 0.28),
  3: Coordinates(0.51, 0.28),
  4: Coordinates(0.34, 0.28),
  5: Coordinates(0.19, 0.28),
  6: Coordinates(0.44, 0.2),
  7: Coordinates(0.25, 0.2),
  8: Coordinates(0.89, 0.55),
  9: Coordinates(0.89, 0.45),
  10: Coordinates(0, 0)
};
Future<int> get(String endpoint) async {
  var res = await http.get(Uri.parse(serverLink + endpoint), headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });
  if (res.statusCode == 200) {
    var jsonObject = json.decode(res.body);
    return jsonObject;
  }

  return -1;
}
