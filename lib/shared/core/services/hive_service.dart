import 'package:bloc_package_example/shared/domain/client/adapters/client.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  // Init hive and Path
  Future<void> initHive() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);

    regAdapters();
    await openBoxes();

    print('hive Init');
  }
//...............................

// Registered all Adapters.
  void regAdapters() {
    Hive.registerAdapter(ClientAdapter());
    print('Register all Adapters ');
  }
  //--------------------------------

  // Open all Boxes.

  Future<void> openBoxes() async {
    await Hive.openBox<Client>('users');
    print('Open all Boxes');
  }
  //..................................
}
