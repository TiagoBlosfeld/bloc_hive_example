import 'package:bloc_package_example/app/modules/client/view_models/client_view_model.dart';

sealed class ClientState {}

final class ClientInitialState extends ClientState {
  ClientInitialState();
}

final class ClientSuccessState extends ClientState {
  final ClientSuccessViewModel clientSuccessViewModel;
  ClientSuccessState({required this.clientSuccessViewModel});
}

final class ClientErrorState extends ClientState {
  final String errorMessage;
  ClientErrorState({required this.errorMessage});
}
