import 'package:flutter/material.dart';

import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';

class ClientSuccessViewModel {
  final List<ClientEntity> clients;
  final Color buttonColor;
  ClientSuccessViewModel({this.clients = const <ClientEntity>[], this.buttonColor = Colors.blue});
  

  ClientSuccessViewModel copyWith({
    List<ClientEntity>? clients,
    Color? buttonColor,
  }) {
    return ClientSuccessViewModel(
      clients: clients ?? this.clients,
      buttonColor: buttonColor ?? this.buttonColor,
    );
  }
}
