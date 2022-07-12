import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  getData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var data = storage.get(key);
    if (data != null) {
      return json.decode(data.toString());
    }
    return data;
  }

  setData(String key, dynamic data) async {
    var storage = await SharedPreferences.getInstance();
    var encodedData = json.encode(data);
    await storage.setString(key, encodedData);
  }

  clearData() async {
    var storage = await SharedPreferences.getInstance();
    // storage.remove("isShowHome");
    // storage.remove("email");
    // storage.remove("name");
    for (String key in storage.getKeys()) {
      print("keys are these $key");
      //if (key != "language_code" && key != "countryCode") {
        storage.remove(key);
      //}
    }

  }

  haveData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var v = storage.containsKey(key);
    return v;
  }

  setBoolData(String key, bool data) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(key, data);
  }


  getBoolData(String key) async {
    var storage = await SharedPreferences.getInstance();
    var data = storage.get(key);

    return data;
  }

}
