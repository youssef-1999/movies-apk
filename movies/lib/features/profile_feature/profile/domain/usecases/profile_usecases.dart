import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;
  GetProfileUseCase(this.repository);
  Future<ProfileEntity> call() => repository.getProfile();
}

class UpdateProfileUseCase {
  final ProfileRepository repository;
  UpdateProfileUseCase(this.repository);
  Future<void> call(ProfileEntity profile) => repository.updateProfile(profile);
}

class DeleteAccountUseCase {
  final ProfileRepository repository;
  DeleteAccountUseCase(this.repository);
  Future<void> call() => repository.deleteAccount();
}
