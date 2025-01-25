import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mainamwal/core/network/global.dart';
import 'package:mainamwal/core/utils/prefrences.dart';

class PurchasesAndSalesReqwest {
  //
  static Future<http.Response> getPurchasesAndSales(
    String type,
    String firstStoreGuid,
    String customerGuid,
    String agentGuid,
    String documentGuid,
    String categoriesGuid,
    String projectDefaultGuid,
    String companiesGuid,
    String transportCompaniesGuid,
    String dueDated,
    String secondStoreGuid,
    String dateFrom,
    String dateTo,
  ) async {
    Map data = {
      "type": type,
      // "FirstStoreGuid": firstStoreGuid,
      // "CustomerGuid": customerGuid,
      // "AgentGuid": agentGuid,
      // "DocumentGuid": documentGuid,
      "CategoriesGuid": categoriesGuid,
      // "ProjectDefaultGuid": projectDefaultGuid,
      "companiesGuid": companiesGuid,
      // "TransportCompaniesGuid": transportCompaniesGuid,
      // "DueDated": dueDated,
      // "SecondStoreGuid": secondStoreGuid,
      // "DateFrom": dateFrom,
      // "DateTo": dateTo,
    };
    print(data);
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}/accounting/dailyPrushAndSale");
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
