// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie(
      {required final String id,
      required final String title,
      required final List<String> categories,
      required final String poster_url,
      required final String runtime,
      required final double imdb_score,
      required final String description,
      required final List<String> movie_screenshots}) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

List<Movie> parseSnapShot(QuerySnapshot snapshot) => snapshot.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      data.addAll({"id": e.id});

      return Movie.fromJson(data);
    }).toList();
