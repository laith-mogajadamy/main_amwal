import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String guid;
  final String code;
  final String name;

  const Store({
    required this.guid,
    required this.code,
    required this.name,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        name,
      ];
}
