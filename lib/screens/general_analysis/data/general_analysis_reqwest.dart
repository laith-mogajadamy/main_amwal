import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';

class GeneralAnalysisReqwest {
  // static Future<http.Response> getdefdates() async {
  //   var url = Uri.parse("${Global.url}/accounting/dailyPrushAndSale-defdates");
  //   Map<String, String> headers = {
  //     "Content-type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${Preferences.getToken()!}",
  //     "p-connection": Preferences.getpconnection()!,
  //     "p-host": Preferences.getphost()!,
  //     "p-port": Preferences.getpport()!,
  //     "p-database": Preferences.getpdatabase()!,
  //     "p-username": Preferences.getpusername()!,
  //     "p-password": Preferences.getppassword()!,
  //     "POSGUID": Preferences.getPOSGUID()!,
  //   };
  //   http.Response response = await http.get(url, headers: headers);

  //   return response;
  // } //

  //
  static Future<http.Response> getGeneralAnalysis(
    String parentGuid,
    String aLER,
    String mainDTL,
    String companyGuid,
    int page,
  ) async {
    Map data = {
      "ParentGuid": parentGuid,
      "ALER": aLER,
      "MainDTL": mainDTL,
      "CompanyGuid": companyGuid,
    };
    print(data);
    var body = jsonEncode(data);
    var url = Uri.parse(
        "${Global.url}/accounting/account-treeList?page=$page&perPage=25");
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
