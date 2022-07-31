import 'dart:convert';
import 'package:http/http.dart' as https;

import 'model/model.dart';

getUser() async {
  var usersLst = [];
  var apiUrl = "https://jsonplaceholder.typicode.com/users";

  var response = await https.get(Uri.parse(apiUrl));
  // print(response);

  var decodedData = jsonDecode(response.body);

  for (var i in decodedData) {
    usersLst.add(ApiData.fromJson(i));
  }
  return usersLst;
}
