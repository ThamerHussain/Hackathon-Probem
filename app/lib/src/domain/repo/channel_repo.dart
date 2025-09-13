import 'package:hackathon/src/domain/entities/content_source.dart';
import 'package:hackathon/src/domain/model/paginate.dart';

abstract class ChannelRepo {
  Future<PaginatedResult<ChannelEntity>> fetchChannels(PaginatedRequest result);
  Future<ChannelEntity> fetchChannelDetails(String channelId);
}
