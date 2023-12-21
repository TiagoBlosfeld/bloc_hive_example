import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';

abstract class IClientsRepository {
  Future<List<ClientEntity>?> loadClients();
  Future<void> saveClients(List<ClientEntity> clients);
  List<ClientEntity> removeAllClients();
  Future<void> removeClient(ClientEntity clientEntity);
}
