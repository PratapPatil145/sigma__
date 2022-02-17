import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreenProvider with ChangeNotifier {
  bool isLoading = true;
  dynamic apiData = [];
  String data = "Fetching Data ....";
  Future getdata() async {
    http.Response response;
    response = await http.get(Uri.parse('https://sigmatenant.com/mobile/tags'));
    if (response.statusCode == 200) {
      apiData = jsonDecode(response.body);
      isLoading = false;
      notifyListeners();
    }
  }
}
