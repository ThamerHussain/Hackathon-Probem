class SkipRange {
  final Duration start;
  final Duration end;

  const SkipRange({required this.start, required this.end});

  ({Duration from, Duration to}) get range => (from: start, to: end);
}

class PlayerSkip {
  final List<SkipRange> familySkipRanges;
  final SkipRange? introRange;
  final SkipRange? outroRange;

  const PlayerSkip({
    required this.familySkipRanges,
    required this.introRange,
    required this.outroRange,
  });

  // empty
  const PlayerSkip.empty()
    : familySkipRanges = const [],
      introRange = null,
      outroRange = null;
}
