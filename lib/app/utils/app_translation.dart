abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "es": es,
  };
}

final Map<String, String> enUS = {
 'watch_now': 'Watch Now',
 'popularity': 'Popularity',
 'billboard': 'Billboard',
 'boys': 'Boys',
 'search': 'Search',
 'over_view': 'OverView',
 'synopsis': 'Synopsis',
 'find_movie': 'Find Movie',
};

final Map<String, String> es = {
  'watch_now': 'Ver ahora',
  'popularity': 'Popularidad',
  'billboard': 'Cartelera',
  'boys': 'Niños',
  'search': 'Búsqueda',
  'over_view': 'Visión general',
  'synopsis': 'Sinopsis',
  'find_movie': 'Buscar película',
};
