import 'package:equatable/equatable.dart';

class AccountType extends Equatable {
  final String name;
  final String val;

  const AccountType({
    required this.name,
    required this.val,
  });

  @override
  List<Object?> get props => [
        name,
        val,
      ];
}
