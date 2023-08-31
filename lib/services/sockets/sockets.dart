import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/services/local_storage/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final socketsProvider = Provider(
  (ref) => Sockets(
    ref.watch(localStorageProvider.future),
  ),
);

class Sockets {
  Sockets(this._localStorage);

  // ignore: unused_field
  final Future<LocalStorage> _localStorage;

  final _log = Logger(filter: DevelopmentFilter());

  connect(String patientID) async {
    final IO.Socket socket = IO.io(
        ApiBase.websocketUri,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({'patient_id': patientID})
            .build());

    socket.onError((error) => _log.i('connect error: $error'));
    socket.onDisconnect((_) => _log.i('socket disconnected'));
    return socket;
  }
}
