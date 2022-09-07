// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String get poster_url => throw _privateConstructorUsedError;
  String get runtime => throw _privateConstructorUsedError;
  double get imdb_score => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get movie_screenshots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      List<String> categories,
      String poster_url,
      String runtime,
      double imdb_score,
      String description,
      List<String> movie_screenshots});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  final Movie _value;
  // ignore: unused_field
  final $Res Function(Movie) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? categories = freezed,
    Object? poster_url = freezed,
    Object? runtime = freezed,
    Object? imdb_score = freezed,
    Object? description = freezed,
    Object? movie_screenshots = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      poster_url: poster_url == freezed
          ? _value.poster_url
          : poster_url // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: runtime == freezed
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      imdb_score: imdb_score == freezed
          ? _value.imdb_score
          : imdb_score // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      movie_screenshots: movie_screenshots == freezed
          ? _value.movie_screenshots
          : movie_screenshots // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$_MovieCopyWith(_$_Movie value, $Res Function(_$_Movie) then) =
      __$$_MovieCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      List<String> categories,
      String poster_url,
      String runtime,
      double imdb_score,
      String description,
      List<String> movie_screenshots});
}

/// @nodoc
class __$$_MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res>
    implements _$$_MovieCopyWith<$Res> {
  __$$_MovieCopyWithImpl(_$_Movie _value, $Res Function(_$_Movie) _then)
      : super(_value, (v) => _then(v as _$_Movie));

  @override
  _$_Movie get _value => super._value as _$_Movie;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? categories = freezed,
    Object? poster_url = freezed,
    Object? runtime = freezed,
    Object? imdb_score = freezed,
    Object? description = freezed,
    Object? movie_screenshots = freezed,
  }) {
    return _then(_$_Movie(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      poster_url: poster_url == freezed
          ? _value.poster_url
          : poster_url // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: runtime == freezed
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String,
      imdb_score: imdb_score == freezed
          ? _value.imdb_score
          : imdb_score // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      movie_screenshots: movie_screenshots == freezed
          ? _value._movie_screenshots
          : movie_screenshots // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie implements _Movie {
  _$_Movie(
      {required this.id,
      required this.title,
      required final List<String> categories,
      required this.poster_url,
      required this.runtime,
      required this.imdb_score,
      required this.description,
      required final List<String> movie_screenshots})
      : _categories = categories,
        _movie_screenshots = movie_screenshots;

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$$_MovieFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _categories;
  @override
  List<String> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String poster_url;
  @override
  final String runtime;
  @override
  final double imdb_score;
  @override
  final String description;
  final List<String> _movie_screenshots;
  @override
  List<String> get movie_screenshots {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movie_screenshots);
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, categories: $categories, poster_url: $poster_url, runtime: $runtime, imdb_score: $imdb_score, description: $description, movie_screenshots: $movie_screenshots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movie &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other.poster_url, poster_url) &&
            const DeepCollectionEquality().equals(other.runtime, runtime) &&
            const DeepCollectionEquality()
                .equals(other.imdb_score, imdb_score) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other._movie_screenshots, _movie_screenshots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(poster_url),
      const DeepCollectionEquality().hash(runtime),
      const DeepCollectionEquality().hash(imdb_score),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_movie_screenshots));

  @JsonKey(ignore: true)
  @override
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      __$$_MovieCopyWithImpl<_$_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  factory _Movie(
      {required final String id,
      required final String title,
      required final List<String> categories,
      required final String poster_url,
      required final String runtime,
      required final double imdb_score,
      required final String description,
      required final List<String> movie_screenshots}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get categories;
  @override
  String get poster_url;
  @override
  String get runtime;
  @override
  double get imdb_score;
  @override
  String get description;
  @override
  List<String> get movie_screenshots;
  @override
  @JsonKey(ignore: true)
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      throw _privateConstructorUsedError;
}
