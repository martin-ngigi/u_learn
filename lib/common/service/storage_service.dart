import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_learn/common/entities/entities.dart';
import 'package:u_learn/common/values/constants.dart';

class StorageService{
  late final SharedPreferences _preferences;

  /// Singleton - pass only one instance
  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async{
    return await _preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async{
    return await _preferences.setString(key, value);
  }


  bool getDeviceFirstOpen() {
    return  _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)??false; /// if null, return false
  }

  bool getIsLoggedIn(){
    /// if null, return false. else true
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  Future<bool> remove(String key){
    return _preferences.remove(key);
  }

  UserItem? getUserProfile(){
    var profileOffline = _preferences.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";  /// if profile doesnt exist, return ""
    if(profileOffline.isNotEmpty){
     return  UserItem.fromJson(jsonDecode(profileOffline)); /// jsonDecode will convert string to json
    }
    ///else
    return null; /// return empty UserItem
  }
}