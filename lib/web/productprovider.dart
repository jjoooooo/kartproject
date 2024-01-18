import 'package:flutter/cupertino.dart';
import 'package:kartproject/web/apiservice.dart';

import '../model/Products.dart';

class ProductProvider with ChangeNotifier{
  List<Products>_plist=[];

  List<Products> get plist => _plist;
  ApiService apiService=ApiService();
  Future<void> Fetch() async {
    _plist=(await apiService.getProducts())!;
    notifyListeners();

  }
}