import 'package:hackathon/src/domain/entities/match.dart';
import 'package:hackathon/src/domain/model/paginate.dart';

abstract class MatchRepo {
  Future<PaginatedResult<MatchEntity>> getMatches(PaginatedRequest request);
}
