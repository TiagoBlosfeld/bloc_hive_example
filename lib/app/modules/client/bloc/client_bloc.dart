import 'package:bloc_package_example/app/modules/client/bloc/client_events.dart';
import 'package:bloc_package_example/app/modules/client/bloc/client_state.dart';
import 'package:bloc_package_example/app/modules/client/view_models/client_view_model.dart';
import 'package:bloc_package_example/shared/domain/client/repositories/iclient_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientBloc extends Bloc<ClientEvents, ClientState> {
  final IClientsRepository _clientRepository;

  ClientBloc({required IClientsRepository clientRepository})
      : _clientRepository = clientRepository,
        super(ClientInitialState()) {
    on<LoadClientsEvent>((event, emit) async {
      await _clientRepository.loadClients().then((value) {
        if (value != null) {
          emit(ClientSuccessState(clientSuccessViewModel: ClientSuccessViewModel(clients: value)));
        } else {
          emit(ClientErrorState(
            errorMessage: 'erro',
          ));
        }
      });
      return;
    });

    on<ChangeButtonColorEvent>(
      (event, emit) {
        emit(ClientSuccessState(
            clientSuccessViewModel: event.clientSuccessViewModel.copyWith(buttonColor: event.color)));
      },
    );

    on<AddClientsEvent>(
      (event, emit) async {
        await _clientRepository.saveClients([event.clientEntity]);
        add(LoadClientsEvent());
      },
    );

    on<RemoveClientEvent>(
      (event, emit) async {
        await _clientRepository.removeClient(event.clientEntity);
        add(LoadClientsEvent());
      },
    );
  }
}
