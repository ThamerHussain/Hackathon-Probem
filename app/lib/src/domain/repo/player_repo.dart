import 'package:hackathon/src/domain/entities/content_source.dart';
import 'package:hackathon/src/domain/entities/home.dart';
import 'package:hackathon/src/domain/entities/player_source.dart';

abstract class PlayerRepo {
  Future<PlayerSource> getMoviePlayerSource(ContentSourceEntity content);
  Future<PlayerSource> getSeriesPlayerSource(EpisodeEntity content);
  Future<PlayerSource> getChannelPlayerSource(ChannelEntity content);
}
