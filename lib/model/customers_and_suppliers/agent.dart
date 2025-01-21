import 'package:equatable/equatable.dart';

class Agent extends Equatable {
  final String guid;
  final String code;
  final String name;

  const Agent({
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
