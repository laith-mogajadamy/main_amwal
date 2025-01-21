import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;

  static const String KEY_IS_First_Time = 'key_is_first_time';
  static const String languageKey = 'en';

  static const String usertoken = 'key_Token';
  static const String useremail = 'key_email';
  static const String userpassword = 'key_password';
  static const String userid = 'key_id';
  static const String API = 'key_API';
  static const String p_connection = 'key_p_connection';
  static const String p_port = 'key_p_port';
  static const String p_host = 'key_p_host';
  static const String p_database = 'key_p_database';
  static const String p_username = 'key_p_username';
  static const String p_password = 'key_p_password';
  static const String POSGUID = 'key_POSGUID';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static clear() async {
    await preferences!.clear();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences?.setBool(KEY_IS_First_Time, isFirstTime);
  }

  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KEY_IS_First_Time);
    if (first == null) {
      return true;
    } else {
      return first;
    }
  }

  static void savetoken(String token) async {
    preferences!.setString(usertoken, token);
  }

  static String? getToken() {
    String? token = preferences!.getString(usertoken);
    if (token == null) {
      return '';
    } else {
      return token;
    }
  }

  static void removeToken() {
    preferences!.remove(usertoken);
  }

  static void saveemail(String email) async {
    preferences!.setString(useremail, email);
  }

  static String? getemail() {
    String? email = preferences!.getString(useremail);
    if (email == null) {
      return '';
    } else {
      return email;
    }
  }

  static void savepassword(String password) async {
    preferences!.setString(userpassword, password);
  }

  static String? getpassword() {
    String? password = preferences!.getString(userpassword);
    if (password == null) {
      return '';
    } else {
      return password;
    }
  }

  static void saveid(int id) async {
    preferences!.setInt(userid, id);
  }

  static int? getid() {
    int? id = preferences!.getInt(userid);
    if (id == null) {
      return null;
    } else {
      return id;
    }
  }

  static void saveAPI(String api) async {
    preferences!.setString(API, api);
  }

  static String? getAPI() {
    String? api = preferences!.getString(API);
    if (api == null) {
      return '';
    } else {
      return api;
    }
  }

  static void savepconnection(String pconnection) async {
    preferences!.setString(p_connection, pconnection);
  }

  static String? getpconnection() {
    String? pconnection = preferences!.getString(p_connection);
    if (pconnection == null) {
      return '';
    } else {
      return pconnection;
    }
  }

  static void savepport(String pport) async {
    preferences!.setString(p_port, pport);
  }

  static String? getpport() {
    String? pport = preferences!.getString(p_port);
    if (pport == null) {
      return '';
    } else {
      return pport;
    }
  }

  static void savephost(String phost) async {
    preferences!.setString(p_host, phost);
  }

  static String? getphost() {
    String? phost = preferences!.getString(p_host);
    if (phost == null) {
      return '';
    } else {
      return phost;
    }
  }

  static void savepdatabase(String pdatabase) async {
    preferences!.setString(p_database, pdatabase);
  }

  static String? getpdatabase() {
    String? pdatabase = preferences!.getString(p_database);
    if (pdatabase == null) {
      return '';
    } else {
      return pdatabase;
    }
  }

  static void savepusername(String pusername) async {
    preferences!.setString(p_username, pusername);
  }

  static String? getpusername() {
    String? pusername = preferences!.getString(p_username);
    if (pusername == null) {
      return '';
    } else {
      return pusername;
    }
  }

  static void saveppassword(String ppassword) async {
    preferences!.setString(p_password, ppassword);
  }

  static String? getppassword() {
    String? ppassword = preferences!.getString(p_password);
    if (ppassword == null) {
      return '';
    } else {
      return ppassword;
    }
  }

  static void savePOSGUID(String pOSGUID) async {
    preferences!.setString(POSGUID, pOSGUID);
  }

  static String? getPOSGUID() {
    String? pOSGUID = preferences!.getString(POSGUID);
    if (pOSGUID == null) {
      return '';
    } else {
      return pOSGUID;
    }
  }

  //
  static void savelanguage(String language) async {
    preferences!.setString(languageKey, language);
  }

  static String? getlanguage() {
    String? language = preferences!.getString(languageKey);
    if (language == null) {
      return '';
    } else {
      return language;
    }
  }
}
