import 'package:mainamwal/model/filters/payment_methode.dart';

class PaymentMethodeModel extends PaymentMethode {
  const PaymentMethodeModel({
    required super.code,
    required super.name,
  });

  factory PaymentMethodeModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodeModel(
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
      );
}
