import 'package:alice/alice.dart';
import 'package:injectable/injectable.dart';

abstract class AliceConfig {
  Alice get instance;
}

@LazySingleton(as: AliceConfig)
class AliceConfigImpl extends AliceConfig {
  Alice? _alice;

  @override
  Alice get instance => _alice ??= Alice(
        showInspectorOnShake: true,
        showNotification: true,
      );
}
