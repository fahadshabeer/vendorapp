
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendorapp/models/user_data_model.dart';

class LoginSharedPref
{
  static Future<void > setData(UserDataModel userDataModel)async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = jsonEncode(userDataModel.toJson());
    sharedPreferences.setString("user", data);
  }
  static Future<UserDataModel?> getdata ()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String data =  sharedPreferences.getString("user") ?? '';
   if(data.isEmpty)
     {
       return null;
     }
   else
     {
       return UserDataModel.fromRawJson(data);
     }

  }
}