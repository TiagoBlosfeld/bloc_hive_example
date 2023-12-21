import 'package:bloc_package_example/shared/data/client/models/client_model.dart';
import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';

class ClientModelToEntityMapper {
  final ClientModel model;
  ClientModelToEntityMapper({
    required this.model,
  });

  ClientEntity toEntity() => ClientEntity(
        name: model.name,
        id: model.id,
      );
}
