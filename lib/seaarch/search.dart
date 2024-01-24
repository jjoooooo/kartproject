import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/Products.dart';
import '../model/ResponseMain.dart';



class ProductProvider extends ChangeNotifier {
  List<Products> _products = [];
  List<Products> get products => _products;
  Future<void> fetchallProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    print(response.body);
    if (response.statusCode == 200) {
      var jsonn=jsonDecode(response.body.toString());
      var res=ResponseMain.fromJson(jsonn);
      var list=res.products;
      _products=list!;
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
  Future<void> fetchProducts({ String ?query}) async {
    print("calling with val=$query");
    _products.clear();
    notifyListeners();

    final response = await http.get(Uri.parse('https://dummyjson.com/products/search?q=${query??""}'));

    if (response.statusCode == 200) {
      var jsonn=jsonDecode(response.body.toString());
      var res=ResponseMain.fromJson(jsonn);
      var list=res.products;
      _products=list!;
      notifyListeners();

    } else {
      throw Exception('Failed to load products');
    }
  }
}