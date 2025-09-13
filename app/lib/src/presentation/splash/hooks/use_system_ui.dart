import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useSystemUIConfiguration() {
  useEffect(() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );

    return () => SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }, []);
}
