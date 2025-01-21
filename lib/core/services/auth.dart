import 'dart:convert';
import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<http.Response> login(
    String email,
    String password,
  ) async {
    Map data = {
      "username": email,
      "password": password,
      "accept_logout": "true"
    };
    var body = jsonEncode(data);

    Map<String, String> headers = {
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
    var url = Uri.parse("${Global.url}/auth/login");
    http.Response response =
        await http.post(url, headers: headers, body: body).timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            jsonEncode(
              {
                "message": 'timed out',
              },
            ),
            408); // Request Timeout response status code
      },
    ).onError(
      (error, stackTrace) {
        return http.Response(
            jsonEncode(
              {
                "message": error.toString(),
              },
            ),
            408);
      },
    );
    return response;
  }

  static Future<http.Response> logout(String token) async {
    var url = Uri.parse("${Global.url}/logout");
    http.Response response = await http
        .post(
      url,
      headers: Global.headers,
    )
        .timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        return logout(token);
      },
    );
    return response;
  }
}
