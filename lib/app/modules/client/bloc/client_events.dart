// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_package_example/app/modules/client/view_models/client_view_model.dart';
import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';
import 'package:flutter/material.dart';

abstract class ClientEvents {}

class LoadClientsEvent extends ClientEvents {}

class AddClientsEvent extends ClientEvents {
  final ClientEntity clientEntity;
  AddClientsEvent({
    required this.clientEntity,
  });
}

class RemoveClientEvent extends ClientEvents {
  final ClientEntity clientEntity;
  RemoveClientEvent({
    required this.clientEntity,
  });
}

class ChangeButtonColorEvent extends ClientEvents {
  final Color color;
  final ClientSuccessViewModel clientSuccessViewModel;
  ChangeButtonColorEvent({
    required this.color,
    required this.clientSuccessViewModel,
  });
}
