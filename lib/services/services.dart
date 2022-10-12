import 'package:http/http.dart' as http;
import 'package:movie_listing/models/movie_list_model.dart';

class Services {
  Future<MovieDetails> getMovieApi() async {
    final url = Uri.parse('https://demo.tech2edge.co/samples/data-sg');
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final body = response.body;
      final movieDetails = movieDetailsFromJson(body);
      //print(movieDetails.series!.title.toString());
      return movieDetails;
    } else {
      final body = response.body;
      final error = movieDetailsFromJson(body);
      //print(error);
      return error;
    }
  }
}
