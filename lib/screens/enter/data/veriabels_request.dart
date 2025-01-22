import 'dart:convert';
import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;

class VeriabelsRequest {
  static Future<http.Response> getcurrency() async {
    var url = Uri.parse("${Global.url}/accounting/currency");
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
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  //
  static Future<http.Response> getcompanys() async {
    var url = Uri.parse("${Global.url}/accounting/company");
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
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  //
  static Future<http.Response> getcitys() async {
    var url = Uri.parse("${Global.url}/accounting/city");
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
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  //
  static Future<http.Response> getaccounttype() async {
    var url = Uri.parse("${Global.url}/accounting/account-type");
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
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  //
  static Future<http.Response> getagents() async {
    var url = Uri.parse("${Global.url}/accounting/agent");
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
    http.Response response = await http.get(url, headers: headers);

    return response;
  }
}
