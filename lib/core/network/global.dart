import 'package:mainamwal/core/utils/prefrences.dart';

class Global {
  static String url = Preferences.getAPI()!;
  static String local = "http://127.0.0.1:8000/api/";
  static Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Preferences.getToken()!}",
    "p-connection": Preferences.getpconnection()!,
    "p-host": Preferences.getphost()!,
    "p-port": Preferences.getpport()!,
    "p-database": Preferences.getpdatabase()!,
    "p-username": Preferences.getpusername()!,
    "p-password": Preferences.getppassword()!,
    "POSGUID": Preferences.getPOSGUID()!,
  };
}
