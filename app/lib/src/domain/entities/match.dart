import 'package:hackathon/src/domain/entities/content_source.dart';
import 'package:hackathon/src/domain/entities/image.dart';

class MatchEntity {
  final String id;
  final bool isLive;
  final TeamEntity team1;
  final TeamEntity team2;
  final DateTime startAt;
  final Duration playedTime;
  final List<ChannelEntity> channels;

  MatchEntity({
    required this.id,
    required this.isLive,
    required this.team1,
    required this.team2,
    required this.startAt,
    required this.playedTime,
    required this.channels,
  });
}

class TeamEntity {
  final String id;
  final String name;
  final ImageEntity image;
  final int score;

  TeamEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.score,
  });
}
