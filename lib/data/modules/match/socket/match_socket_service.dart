import 'dart:async';
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:janken_app/data/api/const.dart';
import 'package:janken_app/data/modules/auth/datasource/auth_local_ds.dart';
import 'package:janken_app/data/modules/match/socket/match_socket_events.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MatchStreamEvent {
  final String name;
  final dynamic data;

  MatchStreamEvent({required this.name, this.data});
}

abstract class MatchSocketService {
  connect();

  dispose();

  Stream<MatchStreamEvent> eventsStream();
}

@Injectable(as: MatchSocketService)
class MatchSocketServiceImpl extends MatchSocketService {
  Socket? socket;

  final AuthLocalDataSource _authLocalDataSource;

  final _eventsBroadcast = StreamController<MatchStreamEvent>.broadcast();

  MatchSocketServiceImpl(this._authLocalDataSource);

  @override
  Stream<MatchStreamEvent> eventsStream() {
    return _eventsBroadcast.stream;
  }

  @override
  connect() {
    socket = io(
      ApiConst.baseUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          .setAuth(
            {'Authorization': 'Bearer ${_authLocalDataSource.accessToken}'},
          )
          .setQuery({'userId': _authLocalDataSource.user.id})
          .disableAutoConnect()
          .build(),
    );

    if (!socket!.connected) {
      socket!.connect();
      log('Connecting to socket');
    }

    socket!.on(MatchSocketEvents.onMatchResult.value, _onMatchResult);
  }

  @override
  dispose() {
    _eventsBroadcast.close();
    socket?.dispose();
  }

  _onMatchResult(data) {
    _eventsBroadcast.add(
      MatchStreamEvent(name: MatchSocketEvents.onMatchResult.name, data: data),
    );
  }
}
