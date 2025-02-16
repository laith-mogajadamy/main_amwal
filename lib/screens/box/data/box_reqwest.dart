import 'dart:convert';

import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;

class BoxReqwest {
  static Future<http.Response> getboxs(
    String token,
  ) async {
    var url = Uri.parse("${Global.url}/accounting/box?paginationFormate=none");
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
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  //
  static Future<http.Response> getboxstatment(
    String token,
    String guid,
    String companyGuid,
    String fromdate,
    String todate,
    int page,
  ) async {
    var url = Uri.parse(
        "${Global.url}/accounting/box-statment?page=$page&perPage=10");
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
    Map data = {
      "Guid": guid,
      "FromDate": fromdate,
      "ToDate": todate,
      "CompanyGuid": companyGuid,
    };
    print(data);
    var body = jsonEncode(data);
    http.Response response = await http.post(url, headers: headers, body: body);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  static Future<http.Response> getboxsstatmentdefdates(
    String token,
    String guid,
  ) async {
    Map data = {
      "Guid": guid,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/box-statment-defdates");
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
    http.Response response = await http.post(url, headers: headers, body: body);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  //
  static Future<http.Response> getboxopeningbalance(
    String guid,
    String companyGuid,
    String fromdate,
    String todate,
  ) async {
    Map data = {
      "Guid": guid,
      "FromDate": fromdate,
      "ToDate": todate,
      "CompanyGuid": companyGuid,
    };
    print(data);

    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/box-openBalance");
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
    http.Response response = await http.post(url, headers: headers, body: body);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  //
  static Future<http.Response> getboxcreditDebitSum(
    String guid,
    String fromdate,
    String todate,
    String companyGuid,
  ) async {
    Map data = {
      "Guid": guid,
      "FromDate": fromdate,
      "ToDate": todate,
      "CompanyGuid": companyGuid,
    };
    print(data);

    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/box-creditDebitSum");
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
    http.Response response = await http.post(url, headers: headers, body: body);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }
}
