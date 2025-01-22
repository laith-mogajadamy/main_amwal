import 'package:equatable/equatable.dart';

class PaymentMethode extends Equatable {
  final String code;
  final String name;

  const PaymentMethode({
    required this.code,
    required this.name,
  });

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
