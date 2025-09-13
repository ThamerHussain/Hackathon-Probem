import 'package:hackathon/src/core/utils/log/log.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

final mainTalker = TalkerRiverpodObserver(
  talker: logger,
  settings: const TalkerRiverpodLoggerSettings(
    printStateFullData: false,
    printFailFullData: false,
  ),
);
