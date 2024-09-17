import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDb {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageKey = "USERIMAGEKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userImageKey, getUserImage);
  }

  Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userIdKey);
  }

  Future<String?> getUseName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userEmailKey);
  }

  Future<String?> getUserImage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userImageKey);
  }
}
