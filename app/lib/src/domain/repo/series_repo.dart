import 'package:hackathon/src/domain/entities/content_source.dart';

abstract class SeriesRepo {
  Future<SerialEntity> getSeries(String seriesId);
  Future<EpisodeEntity> getNextEpisode(EpisodeEntity episode);
}
