import 'package:shared_preferences/shared_preferences.dart';

class saveMyData {
  static String memeKey = "MEMEKEY";

  static Future<bool> saveData(int val) async {
    //method named as saveData in which i am passing integer value an updating the value of memeKey because the method future is bool so i am returning bool value

    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(memeKey,val); //pas the memekey and key m jo bhi val store krwani h wo pass krwani hai
  }

  static Future<int?> fetchData() async {//fetchdata name ka method which will fetch the value of memekey
    final inst = await SharedPreferences.getInstance();
    return await inst.getInt(memeKey);
  }
  
}
