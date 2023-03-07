// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DummyMovie {
  final bool adult;
  final String? backdrop_path;
  final List<int> genre_ids;
  final int id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String? poster_path;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;
  DummyMovie({
    required this.adult,
    this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    this.poster_path,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  DummyMovie copyWith({
    bool? adult,
    String? backdrop_path,
    List<int>? genre_ids,
    int? id,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    String? poster_path,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) {
    return DummyMovie(
      adult: adult ?? this.adult,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      genre_ids: genre_ids ?? this.genre_ids,
      id: id ?? this.id,
      original_language: original_language ?? this.original_language,
      original_title: original_title ?? this.original_title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      poster_path: poster_path ?? this.poster_path,
      title: title ?? this.title,
      video: video ?? this.video,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdrop_path,
      'genre_ids': genre_ids,
      'id': id,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'title': title,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory DummyMovie.fromMap(Map<String, dynamic> map) {
    return DummyMovie(
      adult: map['adult'] as bool,
      backdrop_path:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      genre_ids: List<int>.from(
          (map['genre_ids'] as List<dynamic>).map((x) => x as int)),
      id: map['id'] as int,
      original_language: map['original_language'] as String,
      original_title: map['original_title'] as String,
      overview: map['overview'] as String,
      popularity: map['popularity'] as double,
      poster_path:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      title: map['title'] as String,
      video: map['video'] as bool,
      vote_average: map['vote_average'] as double,
      vote_count: map['vote_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DummyMovie.fromJson(String source) =>
      DummyMovie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DummyMovie(adult: $adult, backdrop_path: $backdrop_path, genre_ids: $genre_ids, id: $id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(covariant DummyMovie other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.backdrop_path == backdrop_path &&
        listEquals(other.genre_ids, genre_ids) &&
        other.id == id &&
        other.original_language == original_language &&
        other.original_title == original_title &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.poster_path == poster_path &&
        other.title == title &&
        other.video == video &&
        other.vote_average == vote_average &&
        other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdrop_path.hashCode ^
        genre_ids.hashCode ^
        id.hashCode ^
        original_language.hashCode ^
        original_title.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        poster_path.hashCode ^
        title.hashCode ^
        video.hashCode ^
        vote_average.hashCode ^
        vote_count.hashCode;
  }
}
