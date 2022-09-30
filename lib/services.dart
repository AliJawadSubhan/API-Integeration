import 'dart:convert';
// import 'package:apiexample/model/test_mode.dart';
import 'package:http/http.dart' as https;

import 'model/model.dart';

getUser({String? query}) async {
  var apiUrl = 'https://jsonplaceholder.typicode.com/users';

  List<ApiData> usersLst = [];
  var results = [];

  var response = await https.get(Uri.parse(apiUrl));
  // print(response);

  var decodedData = jsonDecode(response.body);
  if (query != null) {
    results = results
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  for (var i in decodedData) {
    usersLst.add(ApiData.fromJson(i));
  }
  return usersLst;
}
