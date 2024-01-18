import 'dart:convert';

import '../model/Products.dart';
import 'package:http/http.dart' as http;

import '../model/ResponseMain.dart';
class ApiService{
  Future<List<Products>?> getProducts() async {
    final response =
    await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonnn = jsonDecode(response.body);
    var resmain = ResponseMain.fromJson(jsonnn);
    var list = resmain.products;
    return list;
  }
}