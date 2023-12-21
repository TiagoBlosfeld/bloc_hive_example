import 'package:bloc_package_example/shared/data/client/models/client_model.dart';

abstract class IClientDatasource {
  Future<List<ClientModel>> loadClients();
  Future<void> saveClients(List<ClientModel> clients);
  Future<void> removeClient(ClientModel client);
}
