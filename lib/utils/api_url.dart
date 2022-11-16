import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {


  ApiUrl._();
  static const String BASE_URL = "https://api.themoviedb.org/3";

  static final String API_KEY = dotenv.env['API_KEY']!;

  static String BASE_IMAGE = "https://image.tmdb.org/t/p/w500";
  static String EXAMPLE = "/example";

  static String UPCOMING_MOVIE = "/movie/upcoming";
  static String POPULAR_MOVIE = "/movie/popular";
  static String MOVIE = "/movie/";

  static const String LOGIN = "/sariroti_md/index.php/login/loginTest";
}