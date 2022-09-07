import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';

class FeedRepository {
  Stream<List<Movie>> getMovies() {
    return FirebaseFirestore.instance
        .collection('movies')
        .snapshots()
        .map(parseSnapShot);
  }
}

final feedRepoProvider = Provider((ref) => FeedRepository());

final allMoviesProvider = StreamProvider<List<Movie>>(
    (ref) => ref.watch(feedRepoProvider).getMovies());
