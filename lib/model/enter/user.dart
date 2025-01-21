import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String guid;
  final String code;
  final dynamic number;
  final String name;
  final bool isAdmin;

  const User({
    required this.guid,
    required this.code,
    required this.name,
    required this.number,
    required this.isAdmin,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        name,
        number,
        isAdmin,
      ];
}
