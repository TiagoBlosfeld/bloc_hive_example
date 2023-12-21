// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'client.g.dart';

@HiveType(typeId: 1)
class Client {
  @HiveField(0)
  String name;

  @HiveField(1)
  String id;
  Client({
    required this.name,
    required this.id,
  });
}
