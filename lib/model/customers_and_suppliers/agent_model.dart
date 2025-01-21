import 'package:mainamwal/model/customers_and_suppliers/agent.dart';

class AgentModel extends Agent {
  const AgentModel({
    required super.guid,
    required super.code,
    required super.name,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
      );
}
