import 'package:movies/features/home/domain/entities/movie_entity.dart';
import 'package:movies/gen/assets.gen.dart';

// Temporary local data until the movies API is wired up.
final List<MovieEntity> dummyMovies = [
  MovieEntity(
    name: 'Hobbs & Shaw',
    image: Assets.posters.hobbsShaw.path,
    rating: 6.4,
  ),
  MovieEntity(
    name: '1917',
    image: Assets.posters.movie1917.path,
    rating: 7.7,
  ),
  MovieEntity(
    name: 'Iron Man 3',
    image: Assets.posters.ironMan3.path,
    rating: 7.1,
  ),
  MovieEntity(
    name: 'Doctor Strange in the Multiverse of Madness',
    image: Assets.posters.doctorStrange.path,
    rating: 7.6,
  ),
  MovieEntity(
    name: 'Captain America: The First Avenger',
    image: Assets.posters.captainAmerica.path,
    rating: 7.7,
  ),
  MovieEntity(
    name: 'Avengers: Endgame',
    image: Assets.posters.avengersEndgame.path,
    rating: 8.4,
  ),
];
