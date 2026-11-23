// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies/core/di/injection.dart' as _i843;
import 'package:movies/features/auth/data/datasources/auth_local_data_source.dart'
    as _i1026;
import 'package:movies/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i803;
import 'package:movies/features/auth/data/repositories/auth_repository_impl.dart'
    as _i388;
import 'package:movies/features/auth/domain/repositories/auth_repository.dart'
    as _i710;
import 'package:movies/features/auth/domain/usecases/forget_password_usecase.dart'
    as _i97;
import 'package:movies/features/auth/domain/usecases/google_signin_usecase.dart'
    as _i216;
import 'package:movies/features/auth/domain/usecases/login_usecase.dart'
    as _i815;
import 'package:movies/features/auth/domain/usecases/register_usecase.dart'
    as _i490;
import 'package:movies/features/auth/domain/usecases/signout_usecase.dart'
    as _i782;
import 'package:movies/features/auth/presentation/cubit/auth_cubit.dart'
    as _i390;
import 'package:movies/features/movie_details/data/datasources/movie_details_remote_data_source.dart'
    as _i13;
import 'package:movies/features/movie_details/data/repositories/movie_details_repository_impl.dart'
    as _i736;
import 'package:movies/features/movie_details/domain/repositories/movie_details_repository.dart'
    as _i760;
import 'package:movies/features/movie_details/domain/usecases/movie_details_usecases.dart'
    as _i823;
import 'package:movies/features/movie_details/presentation/cubit/movie_details_cubit.dart'
    as _i334;
import 'package:movies/features/search_feature/features/search/data/datasources/search_remote_data_source.dart'
    as _i792;
import 'package:movies/features/search_feature/features/search/data/repositories/search_repository_impl.dart'
    as _i972;
import 'package:movies/features/search_feature/features/search/domain/repositories/search_repository.dart'
    as _i324;
import 'package:movies/features/search_feature/features/search/domain/usecases/search_movies_usecase.dart'
    as _i1047;
import 'package:movies/features/search_feature/features/search/presentation/cubit/search_cubit.dart'
    as _i767;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => firebaseModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore,
    );
    gh.lazySingleton<_i13.MovieDetailsRemoteDataSource>(
      () => _i13.MovieDetailsRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i803.AuthRemoteDataSource>(
      () => _i803.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i792.SearchRemoteDataSource>(
      () => _i792.SearchRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i1026.AuthLocalDataSource>(
      () => _i1026.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i760.MovieDetailsRepository>(
      () => _i736.MovieDetailsRepositoryImpl(
        gh<_i13.MovieDetailsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i324.SearchRepository>(
      () => _i972.SearchRepositoryImpl(gh<_i792.SearchRemoteDataSource>()),
    );
    gh.lazySingleton<_i710.AuthRepository>(
      () => _i388.AuthRepositoryImpl(
        gh<_i803.AuthRemoteDataSource>(),
        gh<_i1026.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i1047.SearchMoviesUseCase>(
      () => _i1047.SearchMoviesUseCase(gh<_i324.SearchRepository>()),
    );
    gh.factory<_i97.ForgetPasswordUsecase>(
      () => _i97.ForgetPasswordUsecase(gh<_i710.AuthRepository>()),
    );
    gh.factory<_i216.GoogleSigninUsecase>(
      () => _i216.GoogleSigninUsecase(gh<_i710.AuthRepository>()),
    );
    gh.factory<_i815.LoginUsecase>(
      () => _i815.LoginUsecase(gh<_i710.AuthRepository>()),
    );
    gh.factory<_i490.RegisterUsecase>(
      () => _i490.RegisterUsecase(gh<_i710.AuthRepository>()),
    );
    gh.factory<_i782.SignoutUsecase>(
      () => _i782.SignoutUsecase(gh<_i710.AuthRepository>()),
    );
    gh.lazySingleton<_i823.GetMovieDetailsUseCase>(
      () => _i823.GetMovieDetailsUseCase(gh<_i760.MovieDetailsRepository>()),
    );
    gh.lazySingleton<_i823.GetMovieSuggestionsUseCase>(
      () =>
          _i823.GetMovieSuggestionsUseCase(gh<_i760.MovieDetailsRepository>()),
    );
    gh.factory<_i767.SearchCubit>(
      () => _i767.SearchCubit(gh<_i1047.SearchMoviesUseCase>()),
    );
    gh.factory<_i334.MovieDetailsCubit>(
      () => _i334.MovieDetailsCubit(
        gh<_i823.GetMovieDetailsUseCase>(),
        gh<_i823.GetMovieSuggestionsUseCase>(),
      ),
    );
    gh.factory<_i390.AuthCubit>(
      () => _i390.AuthCubit(
        loginusecase: gh<_i815.LoginUsecase>(),
        googleSigninUsecase: gh<_i216.GoogleSigninUsecase>(),
        registerUsecase: gh<_i490.RegisterUsecase>(),
        forgetPasswordUsecase: gh<_i97.ForgetPasswordUsecase>(),
        signOutUsecase: gh<_i782.SignoutUsecase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i843.FirebaseModule {}
