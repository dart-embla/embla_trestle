import 'package:embla/application.dart';
import 'package:trestle/gateway.dart';

export 'gateway.dart';
export 'model.dart';
export 'orm.dart';

class DatabaseBootstrapper extends Bootstrapper {
  final Gateway gateway;

  DatabaseBootstrapper({Driver driver})
    : gateway = new Gateway(driver ?? new InMemoryDriver());

  @Hook.init
  init() async {
    await gateway.connect();
  }

  @Hook.bindings
  bindings() {
    return container.bind(Gateway, to: gateway);
  }

  @Hook.exit
  exit() async {
    await gateway.disconnect();
  }
}
