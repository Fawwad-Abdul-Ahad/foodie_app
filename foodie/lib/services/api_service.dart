import 'dart:convert';

import 'package:foodie/viewmodel/home1/productModel.dart';
import 'package:http/http.dart' as http;
class ApiSrvice {
  
  Future<List<productModel>> getData() async {
    List<productModel> data = [];
    var mainUrl =
        'https://muhammad-usman08.github.io/Hackathon_Project_Backend/data/products_data.js';
    var url = Uri.parse(mainUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        // Trim any potential whitespace or extraneous text from the JSON response
        String jsonString = response.body.trim();

        // Parse the cleaned JSON string
        var jsonResponse = jsonDecode(jsonString) as List;

        // Map and add items to data
        data = jsonResponse.map((item) => productModel.fromJson(item)).toList();
      } catch (e) {
        print('Error parsing JSON: $e');
      }
    } else {
      print('Failed to load data, Status code: ${response.statusCode}');
    }
    return data;
  }
}