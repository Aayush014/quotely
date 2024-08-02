import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  Future<List<Map<String, dynamic>>> fetchApi() async {
    String api = "https://sheetdb.io/api/v1/jzuaa2yk994jo";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = response.body;
      List<dynamic> json = jsonDecode(data);
      return json.cast<Map<String, dynamic>>();
    } else {
      print("Failed to fetch data");
      return [];
    }
  }
}
