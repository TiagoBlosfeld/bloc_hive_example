// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_package_example/shared/data/client/models/client_model.dart';
import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';

class ClientEntityToModelMapper {
  final ClientEntity entity;
  ClientEntityToModelMapper({
    required this.entity,
  });

  ClientModel toModel() => ClientModel(name: entity.name, id: entity.id ?? '');
}
