import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/watchlist/domain/usecases/watchlist_usecases.dart';
import '../../domain/usecases/profile_usecases.dart';
import 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
    final DeleteProfileUseCase deleteProfileUseCase;
  final GetWatchlistUseCase getWatchlistUseCase;
  late final StreamSubscription _watchSub;

  ProfileCubit(
    this.getProfileUseCase,
    this.updateProfileUseCase,
    this.deleteProfileUseCase,
    this.getWatchlistUseCase,
    WatchWatchlistUseCase watchWatchlist,
  ) : super(ProfileInitial()) {
    _watchSub = watchWatchlist().listen((list) {
      final s = state;
      if (s is ProfileLoaded) emit(ProfileLoaded(s.profile, list));
    });
  }

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      emit(ProfileLoaded(await getProfileUseCase(), getWatchlistUseCase()));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required int avatarIndex,
  }) async {
    final current = state;
    if (current is! ProfileLoaded) return;
    try {
      final updated = current.profile
          .copyWith(name: name, phone: phone, avatarIndex: avatarIndex);
      await updateProfileUseCase(updated);
      emit(ProfileLoaded(updated, current.watchlist));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteLocalProfile() => deleteProfileUseCase();

  @override
  Future<void> close() async {
    await _watchSub.cancel();
    return super.close();
  }
}