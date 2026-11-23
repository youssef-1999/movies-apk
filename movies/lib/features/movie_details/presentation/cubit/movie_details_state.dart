import 'package:equatable/equatable.dart';
import 'package:movies/features/movie_details/domain/entities/movie_details.dart';
import 'package:movies/features/search_feature/features/search/domain/entities/movie.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetails movie;

  /// Similar movies. Empty if the suggestions request failed.
  final List<Movie> similar;

  const MovieDetailsSuccess(this.movie, this.similar);

  @override
  List<Object?> get props => [movie, similar];
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  const MovieDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
