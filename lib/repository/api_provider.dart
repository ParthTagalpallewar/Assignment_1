import 'package:untitled/models/network_response.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/product_model.dart';
import 'package:untitled/models/response_type.dart';
import 'dart:convert';

class ApiProvider {
  static final baseUrl = "";

  static Future<NetworkResponse> getProducts() async {
    try {
      final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        dynamic result =
            jsonData.map((json) => Product.fromJson(json)).toList();
        return NetworkResponse(
            ResponseType.SUCCESS, result, response.statusCode);
      } else {
        print("wrong statis code ${response.statusCode}");
        return NetworkResponse(
            ResponseType.FAILURE, "Unable to Fetch Data", response.statusCode);
      }
    } catch (error) {
      print("error $error");
      return NetworkResponse(ResponseType.FAILURE, error.toString(), 500);
    }
  }
}
