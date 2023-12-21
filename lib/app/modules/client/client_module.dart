import 'package:bloc_package_example/app/modules/client/bloc/client_bloc.dart';
import 'package:bloc_package_example/app/modules/client/client_page.dart';
import 'package:bloc_package_example/shared/data/client/datasource/iclient_dataource.dart';
import 'package:bloc_package_example/shared/data/client/datasource/remote/client_datasource_impl.dart';
import 'package:bloc_package_example/shared/data/client/repository/clients_repository.dart';
import 'package:bloc_package_example/shared/domain/client/repositories/iclient_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<IClientDatasource>((i) => ClientDatasourceImpl()),
    Bind.factory<IClientsRepository>((i) => ClientsRepository(datasource: i.get())),
    Bind.factory((i) => ClientBloc(clientRepository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ClientPage(clientBloc: Modular.get<ClientBloc>(),)),
  ];
}
