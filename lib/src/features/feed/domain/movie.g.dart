// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      title: json['title'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      poster_url: json['poster_url'] as String,
      runtime: json['runtime'] as String,
      imdb_score: (json['imdb_score'] as num).toDouble(),
      description: json['description'] as String,
      movie_screenshots: (json['movie_screenshots'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'title': instance.title,
      'categories': instance.categories,
      'poster_url': instance.poster_url,
      'runtime': instance.runtime,
      'imdb_score': instance.imdb_score,
      'description': instance.description,
      'movie_screenshots': instance.movie_screenshots,
    };
