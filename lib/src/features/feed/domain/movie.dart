// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie(
      {required final String title,
      required final List<String> categories,
      required final String poster_url,
      required final String runtime,
      required final double imdb_score,
      required final String description,
      required final List<String> movie_screenshots}) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
