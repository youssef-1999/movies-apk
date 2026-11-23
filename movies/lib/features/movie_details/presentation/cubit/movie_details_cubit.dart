import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/app_exception.dart';
import 'package:movies/features/movie_details/domain/usecases/movie_details_usecases.dart';
import 'package:movies/features/movie_details/presentation/cubit/movie_details_state.dart';
import 'package:movies/features/search_feature/features/search/domain/entities/movie.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getDetails;
  final GetMovieSuggestionsUseCase _getSuggestions;

  MovieDetailsCubit(this._getDetails, this._getSuggestions)
      : super(const MovieDetailsLoading());

  Future<void> load(int movieId) async {
    emit(const MovieDetailsLoading());
    try {
      // Suggestions are optional: if they fail, still show the movie.
      final suggestions =
          _getSuggestions(movieId).catchError((_) => <Movie>[]);
      final details = await _getDetails(movieId);
      final similar = await suggestions;
      if (isClosed) return;
      emit(MovieDetailsSuccess(details, similar));
    } catch (e) {
      if (isClosed) return;
      emit(MovieDetailsError(
        e is AppException ? e.message : 'Something went wrong. Please try again.',
      ));
    }
  }
}
