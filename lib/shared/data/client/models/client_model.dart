// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
  final String id;
  final String name;
  ClientModel({
    required this.name,
    required this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
