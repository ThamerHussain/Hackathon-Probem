import 'package:hackathon/src/domain/entities/image.dart';

class MovieEntity {}

class SerialEntity {
  final String id;
  final int seasonCount;
  final List<EpisodeEntity> episodes;

  SerialEntity({
    required this.id,
    required this.seasonCount,
    required this.episodes,
  });
}

class SessionEntity {
  final String id;
  final String title;
  final int seasonNumber;
  final List<EpisodeEntity> episodes;

  SessionEntity({
    required this.id,
    required this.title,
    required this.seasonNumber,
    required this.episodes,
  });
}

class ChannelEntity {
  final String id;
  final String title;
  final ImageEntity image;

  ChannelEntity({required this.id, required this.title, required this.image});
}

class EpisodeEntity {
  final String id;
  final String title;
  final String seriesId;
  final String description;
  final ImageEntity image;
  final int episodeNumber;
  final int seasonNumber;

  /// isInLastSeason are used to determine if the episode is in last season
  final bool isInLastSeason;

  // /// isInFirstSeason are used to determine if the episode is in first season
  // final bool isInFirstSeason;

  /// isLastEpisodeInSeason are used to determine if the episode is the last episode in the season
  final bool isLastEpisodeInSeason;

  bool get canGetNextEpisode => !isLastEpisodeInSeason || !isInLastSeason;

  // /// isFirstEpisodeInSeason are used to determine if the episode is the first episode in the season
  // final bool isFirstEpisodeInSeason;

  EpisodeEntity({
    required this.id,
    required this.title,
    required this.seriesId,
    required this.description,
    required this.image,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.isInLastSeason,
    // required this.isInFirstSeason,
    required this.isLastEpisodeInSeason,
    // required this.isFirstEpisodeInSeason,
  });
}
