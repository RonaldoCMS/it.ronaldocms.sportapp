enum LeagueType {
  IT_SERIE_A,
  EN_PREMIER_LEAGUE,
  DE_BUNDESLIGA,
  FR_LIGUE_1,
  ES_PRIMIERA_DIVISION
}

class Util {
  static int getIDFromLeague(LeagueType league) {
    switch (league) {
      case LeagueType.IT_SERIE_A:
        return 135;

      case LeagueType.EN_PREMIER_LEAGUE:
        return 0;

      case LeagueType.DE_BUNDESLIGA:
        return 0;

      case LeagueType.ES_PRIMIERA_DIVISION:
        return 0;

      case LeagueType.FR_LIGUE_1:
        return 0;
    }
  }

  static LeagueType getLeagueFromId(int id) {
    switch (id) {
      case 135:
        return LeagueType.IT_SERIE_A;

      case 0:
        return LeagueType.EN_PREMIER_LEAGUE;

      case 0:
        return LeagueType.DE_BUNDESLIGA;

      case 0:
        return LeagueType.ES_PRIMIERA_DIVISION;

      case 0:
        return LeagueType.FR_LIGUE_1;
    }
    return LeagueType.IT_SERIE_A;
  }
}
