class ApiConst {
  static String apiKey = '41aa18abb8974c0ea27098038f6feb1b';
  static String weatherByCityName(String name) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$name,&appid=$apiKey';
}
