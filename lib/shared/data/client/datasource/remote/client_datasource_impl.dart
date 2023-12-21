// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc_package_example/shared/data/client/datasource/iclient_dataource.dart';
import 'package:bloc_package_example/shared/data/client/models/client_model.dart';
import 'package:bloc_package_example/shared/domain/client/adapters/client.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class ClientDatasourceImpl implements IClientDatasource {
  @override
  Future<List<ClientModel>> loadClients() async {
    final clients = Hive.box<Client>('users').values.toList();
    List<ClientModel> list = [];

    for (var element in clients) {
      list.add(ClientModel(name: element.name, id: element.id));
    }
    return list;
  }

  @override
  Future<void> saveClients(List<ClientModel> clients) async {
    final userBox = Hive.box<Client>('users');

    for (var client in clients) {
      var id = const Uuid().v1();
      await userBox.put(id, Client(name: client.name, id: id));
    }
  }

  @override
  Future<void> removeClient(ClientModel client) async {
    final userBox = Hive.box<Client>('users');

    userBox.delete(client.id);
  }
}
