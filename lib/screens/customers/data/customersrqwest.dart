import 'dart:convert';
import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;

class CustomersReqwest {
  static Future<http.Response> getcustomers(
    String token,
    List filters,
    int page,
  ) async {
    String sortingBase64 = base64Encode(utf8.encode(jsonEncode(filters)));
    var url = Uri.parse(
        "${Global.url}/accounting/client?filters=$sortingBase64&page=$page&perPage=25");
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
    var resmap = jsonDecode(response.body);
    print(resmap);
    return response;
  }

  static Future<http.Response> getsuppliers(
    String token,
    List filters,
    int page,
  ) async {
    String sortingBase64 = base64Encode(utf8.encode(jsonEncode(filters)));
    var url = Uri.parse(
        "${Global.url}/accounting/supplier?filters=$sortingBase64&page=$page&perPage=25");
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

  static Future<http.Response> getagentcardcustomer(
    String guid,
  ) async {
    var url = Uri.parse("${Global.url}/accounting/client/$guid");
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

  static Future<http.Response> getagentcardsupplier(
    String guid,
  ) async {
    var url = Uri.parse("${Global.url}/accounting/supplier/$guid");
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

  static Future<http.Response> getdefdate(
    String guid,
  ) async {
    Map data = {
      "Guid": guid,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/statment-defdates");
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
  static Future<http.Response> getstatment(
    String guid,
    String tybe,
    String fromdate,
    String todate,
    int page,
    int perPage,
  ) async {
    Map data = {
      "Guid": guid,
      "Type": tybe,
      "FromDate": fromdate,
      "ToDate": todate
    };
    print(data);
    var body = jsonEncode(data);
    var url = Uri.parse(
        "${Global.url}/accounting/statment?page=$page&perPage=$perPage");
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
  static Future<http.Response> getstatmentopeningbalance(
    String guid,
    String tybe,
    String fromdate,
    String todate,
  ) async {
    Map data = {
      "Guid": guid,
      "Type": tybe,
      "FromDate": fromdate,
      "ToDate": todate
    };
    print(data);

    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/statment-openBalance");
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
  static Future<http.Response> getstatmentcreditDebitSum(
    String guid,
    String tybe,
    String fromdate,
    String todate,
  ) async {
    Map data = {
      "Guid": guid,
      "Type": tybe,
      "FromDate": fromdate,
      "ToDate": todate
    };
    print(data);

    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/statment-creditDebitSum");
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
