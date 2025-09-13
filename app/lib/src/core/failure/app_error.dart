import 'package:hackathon/localization/strings.g.dart';
import 'package:hackathon/src/core/failure/base.dart';

class NoNextEpisodeFailure implements BaseFailure {
  const NoNextEpisodeFailure();

  @override
  String translate(Translations localizations) {
    return localizations.errorMessage.noNextEpisode;
  }
}
