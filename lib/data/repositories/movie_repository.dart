import 'package:p6_mopro/data/services/omdb_service.dart';
import 'package:p6_mopro/models/movie_detail_model.dart';
import 'package:p6_mopro/models/movie_model.dart';

class MovieRepository {
  final OmdbService _omdbService;

  MovieRepository ({required OmdbService omdbService}) : _omdbService = omdbService;

  Future<List<Movie>> fetchMovies(String query) async {
    try {
      final rawData = await _omdbService.getMovies(query);

      return rawData.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetail> getMovieDetail(String id) async {
    try {
      final json = await _omdbService.getMovieDetail(id);

      return MovieDetail.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}