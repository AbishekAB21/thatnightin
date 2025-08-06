class PercentageConversion {
  
  double percentageConverterFromNonPercentageValue(
    int homeTeamStat,
    int awayTeamStat,
  ) {
    int total = homeTeamStat + awayTeamStat;
    double percent = (homeTeamStat / total) * 100;
    return percent;
  }

  double percentageConverterFromPercentageValue(
    double homeTeamPercent,
    double awayTeamPercent,
  ) {
    double total = homeTeamPercent + awayTeamPercent;

    if (total == 0) return 0;

    return (homeTeamPercent / total) * 100;
  }
}
