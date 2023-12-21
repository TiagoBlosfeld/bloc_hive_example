import 'package:bloc_package_example/app/modules/client/bloc/client_bloc.dart';
import 'package:bloc_package_example/app/modules/client/bloc/client_events.dart';
import 'package:bloc_package_example/app/modules/client/bloc/client_state.dart';
import 'package:bloc_package_example/shared/domain/client/entities/client_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPage extends StatefulWidget {
  final ClientBloc clientBloc;
  const ClientPage({super.key, required this.clientBloc});

  @override
  State<ClientPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ClientPage> {
  late ClientEntity currentClient;

  @override
  void initState() {
    super.initState();
    widget.clientBloc.add(LoadClientsEvent());
  }

  @override
  void dispose() {
    widget.clientBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientBloc.add(AddClientsEvent(clientEntity: currentClient));
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Clients', style: Theme.of(context).textTheme.titleLarge),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BlocBuilder<ClientBloc, ClientState>(
                    bloc: widget.clientBloc,
                    builder: (context, state) {
                      if (state is ClientInitialState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ClientErrorState) {
                        return const Text('Error');
                      } else if (state is ClientSuccessState) {
                        final clientsList = state.clientSuccessViewModel.clients;
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: clientsList.length,
                              itemBuilder: (context, index) {
                                currentClient = clientsList[index];
                                return ListTile(
                                  leading: Text((index + 1).toString()),
                                  title: Text(clientsList[index].name),
                                  trailing: IconButton(
                                      onPressed: () =>
                                          widget.clientBloc.add(RemoveClientEvent(clientEntity: clientsList[index])),
                                      icon: const Icon(Icons.remove)),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                widget.clientBloc.add(ChangeButtonColorEvent(
                                    color: Colors.amber, clientSuccessViewModel: state.clientSuccessViewModel));
                              },
                              color: state.clientSuccessViewModel.buttonColor,
                              icon: Icon(
                                Icons.abc,
                                color: state.clientSuccessViewModel.buttonColor,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
