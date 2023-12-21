import 'dart:developer';

import 'package:bloc_package_example/shared/data/client/datasource/iclient_dataource.dart';
import 'package:bloc_package_example/shared/data/client/mappers/client_entity_to_model_mapper.dart';
import 'package:bloc_package_example/shared/data/client/mappers/client_model_to_entity_mapper.dart';
import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';
import 'package:bloc_package_example/shared/domain/client/repositories/iclient_repository.dart';

class ClientsRepository implements IClientsRepository {
  final IClientDatasource datasource;

  ClientsRepository({
    required this.datasource,
  });

  final List<ClientEntity> _clients = [];

  @override
  Future<List<ClientEntity>?> loadClients() async {
    try {
      return await datasource.loadClients().then(
            (value) => value.map((e) => ClientModelToEntityMapper(model: e).toEntity()).toList(),
          );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveClients(List<ClientEntity> clients) async {
    try {
      datasource.saveClients(clients.map((e) => ClientEntityToModelMapper(entity: e).toModel()).toList());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  List<ClientEntity> removeAllClients() {
    _clients.clear();
    return _clients;
  }


  @override
  Future<List<ClientEntity>?> removeClient(ClientEntity clientEntity) async {
    datasource.removeClient(ClientEntityToModelMapper(entity: clientEntity).toModel());
    return _clients;
  }
}
