import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/profile_usecases.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
    required this.deleteAccountUseCase,
  }) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      emit(ProfileLoaded(await getProfileUseCase()));
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
      emit(ProfileLoaded(updated));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    await deleteAccountUseCase();
    await loadProfile(); // resets to defaults
  }
}
