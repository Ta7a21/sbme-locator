import 'dart:convert';
import 'package:http/http.dart' as http;

class Coordinates {
  double x;
  double y;
  Coordinates(this.x, this.y);
}

const String serverLink = 'http://localhost:8433/';
Future<int> getLocation() async {
  var res = await http.get(Uri.parse(serverLink + 'location'), headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });
  if (res.statusCode == 200) {
    var jsonObject = json.decode(res.body);
    return jsonObject;
  }

  return -1;
}
