enum MatchSocketEvents {
  onFoundOpponent('onFoundOpponent'),
  onMatchResult('onMatchResult');

  const MatchSocketEvents(this.value);

  final String value;
}
