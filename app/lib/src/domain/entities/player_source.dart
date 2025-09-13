import 'package:hackathon/src/domain/entities/player_skip.dart';

sealed class PlayerSource {
  final bool isLive;
  final PlayerSkip skip;
  const PlayerSource({this.isLive = false, required this.skip});
}

class MP4Source extends PlayerSource {
  final String url;
  final List<QualityItem> quality;
  final List<SubtitleItem> subtitles;
  const MP4Source(
    this.url,
    this.quality, {
    this.subtitles = const [],
    super.isLive,
    required super.skip,
  });

  @override
  String toString() {
    return 'MP4Source{url: $url, quality: $quality, subtitles: $subtitles}';
  }
}

class DashStreamSource extends PlayerSource {
  final String url;
  const DashStreamSource(this.url, {super.isLive, required super.skip});
}

class WidevineDrmDashSource extends PlayerSource {
  final String url;
  final String licenseUrl;
  const WidevineDrmDashSource(
    this.url,
    this.licenseUrl, {
    super.isLive,
    required super.skip,
  });
}

class StarzPlayWidevineDrmDashSource extends PlayerSource {
  final String token;
  final String url;
  final String licenseUrl;
  const StarzPlayWidevineDrmDashSource({
    required this.url,
    required this.licenseUrl,
    required this.token,
    super.isLive,
    required super.skip,
  });
}

class HlsSource extends PlayerSource {
  final String url;
  const HlsSource(this.url, {super.isLive, required super.skip});
}

class QualityItem {
  final String url;
  final String quality;

  QualityItem({required this.url, required this.quality});
}

class SubtitleItem {
  final String url;
  final String language;
  final String name;
  final String? format; // e.g., 'srt', 'vtt', 'ass'

  SubtitleItem({
    required this.url,
    required this.language,
    required this.name,
    this.format,
  });
}
