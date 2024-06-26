import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';

final movieListStateNotifierProvider =
    StateNotifierProvider<MovieListStateNotifier, AsyncValue<List<Movie>>>(
        (ref) {
  return MovieListStateNotifier(ref);
});

final movieStateNotifierProvider =
    StateNotifierProvider.family<MovieStateNotifier, AsyncValue<Movie>, int>(
        (ref, id) {
  return MovieStateNotifier(ref, id);
});

final movieIDProvider = StateProvider((ref) => 0);
